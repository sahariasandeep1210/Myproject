
package com.tf.controller.brochure;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.portlet.PortletURL;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.repository.model.Folder;
import com.liferay.portal.kernel.servlet.HttpHeaders;
import com.liferay.portal.kernel.util.ContentTypes;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portlet.PortletURLUtil;
import com.liferay.portlet.documentlibrary.model.DLFileEntry;
import com.liferay.portlet.documentlibrary.model.DLFolderConstants;
import com.liferay.portlet.documentlibrary.service.DLAppServiceUtil;
import com.liferay.portlet.documentlibrary.service.DLFileEntryLocalServiceUtil;
import com.tf.controller.brochure.util.InvestorDTO;
import com.tf.model.Brochure;
import com.tf.service.BrochureService;

/**
 * This controller is responsible for request/response handling on Investor
 * screens
 * 
 * @author Gautam Sharma
 */
@Controller
@RequestMapping(value = "VIEW")
public class BrochureController {
    

	protected Log _log = LogFactoryUtil.getLog(BrochureController.class);
	private static final String VIEW_PAGE = "brouchur";

	@Autowired
	protected BrochureService brochureService;


	@RenderMapping
	protected ModelAndView renderInvestorProtfolios(
		@ModelAttribute("investorDTO") InvestorDTO investorDTO, ModelMap model, RenderRequest request, RenderResponse response)
		throws Exception {
		_log.info("Render InvestorController ");
	    model.put("investorList", "");
	    boolean canDownload=false;
	    if(request.getAttribute("toDownload")!=null){
	    	canDownload=(Boolean) request.getAttribute("toDownload");;
	    }
	    model.put("canDownload", canDownload);
		return new ModelAndView(VIEW_PAGE, model);
	}
	
	@ResourceMapping("saveInfo")
	protected void saveBrochureInfo(
		ResourceRequest request, ResourceResponse response, ModelMap model)
		throws Exception {
		String fName = request.getParameter("fName");
		String lName = request.getParameter("lName");
		String email = request.getParameter("email");
		String pNumber = request.getParameter("pNumber");
		String cName = request.getParameter("cName");
		PortletURL url = PortletURLUtil.getCurrent(request, response);
		Brochure brochure  = new Brochure();
		if(url.toString().contains("/buyer")){
			brochure.setBrochureType('B');
		}else{
			brochure.setBrochureType('I');
		}
		brochure.setFirstName(fName);
		brochure.setLastName(lName);
		brochure.setEmail(email);
		brochure.setPhone(pNumber);
		brochure.setCompanyName(cName);
		brochureService.saveBrochure(brochure);
		
	 }

	@ResourceMapping("pdfBrochurDownloadUrl")
	public void downloadBrochure(ResourceRequest request, ResourceResponse response)
			throws IOException, PortalException, SystemException {
		ThemeDisplay themeDispay = (ThemeDisplay) request
				.getAttribute(WebKeys.THEME_DISPLAY);
	    long parentFolderId = DLFolderConstants.DEFAULT_PARENT_FOLDER_ID;
	    String currentURL = PortletURLUtil.getCurrent(request, response).toString();
	    InputStream contentStream=null;
	    try {
			Folder folder =DLAppServiceUtil.getFolder(themeDispay.getScopeGroupId(), parentFolderId, "Broucher");
			List<DLFileEntry> dlFileEntries = DLFileEntryLocalServiceUtil.getFileEntries(themeDispay.getScopeGroupId(), folder.getFolderId());
			for (DLFileEntry file : dlFileEntries) {
				contentStream = file.getContentStream();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			OutputStream out = response.getPortletOutputStream();
			response.setContentType(ContentTypes.APPLICATION_PDF);
			response.addProperty(HttpHeaders.CONTENT_DISPOSITION, "pawan.pdf");
			response.addProperty("Set-Cookie", "fileDownload=true; path=/");
			response.addProperty("Cache-Control", "no-cache, no-store, must-revalidate");
			IOUtils.copy(contentStream, out);
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	

}
