package com.tf.hook;


import com.liferay.portal.kernel.bean.BeanReference;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.PrefsPropsUtil;
import com.liferay.portal.kernel.util.PropsKeys;
import com.liferay.portal.kernel.util.StringUtil;
import com.liferay.portal.model.Group;
import com.liferay.portal.model.Layout;
import com.liferay.portal.model.Ticket;
import com.liferay.portal.model.TicketConstants;
import com.liferay.portal.model.User;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.UserLocalService;
import com.liferay.portal.service.UserLocalServiceWrapper;
import com.liferay.portal.util.SubscriptionSender;
import com.liferay.util.PwdGenerator;

public class TFUserLocalServiceImpl extends UserLocalServiceWrapper {

    public TFUserLocalServiceImpl(UserLocalService userLocalService) {
        super(userLocalService);
    }


	
	@BeanReference(type = com.liferay.portal.service.LayoutLocalService.class)
	protected com.liferay.portal.service.LayoutLocalService layoutLocalService;
	
	@BeanReference(type = com.liferay.portal.service.TicketLocalService.class)
	protected com.liferay.portal.service.TicketLocalService ticketLocalService;
	
	/**
	 * Returns the layout local service.
	 *
	 * @return the layout local service
	 */
	public com.liferay.portal.service.LayoutLocalService getLayoutLocalService() {
		return layoutLocalService;
	}

	/**
	 * Sets the layout local service.
	 *
	 * @param layoutLocalService the layout local service
	 */
	public void setLayoutLocalService(
		com.liferay.portal.service.LayoutLocalService layoutLocalService) {
		this.layoutLocalService = layoutLocalService;
	}
	
	/**
	 * Returns the ticket local service.
	 *
	 * @return the ticket local service
	 */
	public com.liferay.portal.service.TicketLocalService getTicketLocalService() {
		return ticketLocalService;
	}

	/**
	 * Sets the ticket local service.
	 *
	 * @param ticketLocalService the ticket local service
	 */
	public void setTicketLocalService(
		com.liferay.portal.service.TicketLocalService ticketLocalService) {
		this.ticketLocalService = ticketLocalService;
	}
	
	
    public User getUserById(long userId)
        throws PortalException, SystemException {

        System.out.println(
            "## MyUserLocalServiceImpl.getUserById(" + userId + ")");

        return super.getUserById(userId);
    }
    
	public void sendEmailAddressVerification(
			User user, String emailAddress, ServiceContext serviceContext)
		throws PortalException, SystemException {
		System.out
				.println("TFUserLocalServiceImpl.sendEmailAddressVerification() :::::::::::::;");

		if (user.isEmailAddressVerified() &&
			StringUtil.equalsIgnoreCase(emailAddress, user.getEmailAddress())) {

			return;
		}

		Ticket ticket = ticketLocalService.addTicket(
			user.getCompanyId(), User.class.getName(), user.getUserId(),
			TicketConstants.TYPE_EMAIL_ADDRESS, emailAddress, null,
			serviceContext);

		String verifyEmailAddressURL =
			serviceContext.getPortalURL() + serviceContext.getPathMain() +
				"/portal/verify_email_address?ticketKey=" + ticket.getKey();

		long plid = serviceContext.getPlid();

		if (plid > 0) {
			Layout layout = layoutLocalService.fetchLayout(plid);

			if (layout != null) {
				Group group = layout.getGroup();

				if (!layout.isPrivateLayout() && !group.isUser()) {
					verifyEmailAddressURL +=
						"&p_l_id=" + serviceContext.getPlid();
				}
			}
		}

		String fromName = PrefsPropsUtil.getString(
			user.getCompanyId(), PropsKeys.ADMIN_EMAIL_FROM_NAME);
		String fromAddress = PrefsPropsUtil.getString(
			user.getCompanyId(), PropsKeys.ADMIN_EMAIL_FROM_ADDRESS);

		String toName = user.getFullName();
		String toAddress = emailAddress;

		String subject = PrefsPropsUtil.getContent(
			user.getCompanyId(), PropsKeys.ADMIN_EMAIL_VERIFICATION_SUBJECT);

		String body = PrefsPropsUtil.getContent(
			user.getCompanyId(), PropsKeys.ADMIN_EMAIL_VERIFICATION_BODY);

		SubscriptionSender subscriptionSender = new SubscriptionSender();

		subscriptionSender.setBody(body);
		subscriptionSender.setCompanyId(user.getCompanyId());
		subscriptionSender.setContextAttributes(
			"[$EMAIL_VERIFICATION_CODE$]", ticket.getKey(),
			"[$EMAIL_VERIFICATION_URL$]", verifyEmailAddressURL,
			"[$REMOTE_ADDRESS$]", serviceContext.getRemoteAddr(),
			"[$REMOTE_HOST$]", serviceContext.getRemoteHost(), "[$USER_ID$]",
			user.getUserId(), "[$USER_SCREENNAME$]", user.getScreenName());
		subscriptionSender.setFrom(fromAddress, fromName);
		subscriptionSender.setHtmlFormat(true);
		subscriptionSender.setMailId(
			"user", user.getUserId(), System.currentTimeMillis(),
			PwdGenerator.getPassword());
		subscriptionSender.setServiceContext(serviceContext);
		subscriptionSender.setSubject(subject);
		subscriptionSender.setUserId(user.getUserId());

		subscriptionSender.addRuntimeSubscribers(toAddress, toName);

		subscriptionSender.flushNotificationsAsync();
	}
  
}