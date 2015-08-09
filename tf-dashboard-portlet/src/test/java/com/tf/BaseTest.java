package com.tf;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Base setup for all unit tests in this artifact. Sets up the application
 * context and runs the tests with Spring's JUnit4 runner.
 * 
 * @author FL867
 * @since Sprint 1
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/applicationContext-test-firmPortlet.xml" })
public abstract class BaseTest
{
	protected transient final Log	testLog	= LogFactory.getLog(getClass());
	private DateFormat				sDF		= new SimpleDateFormat("hh:MM:ss:SS");

	/**
	 * Utility method that prints the class name and method name along with the time stamp.
	 */
	protected void printTitle()
	{
		String callingMethod = new Exception().getStackTrace()[1].getMethodName();
		System.out.println(("\n******* " + callingMethod + " | " + sDF.format(Calendar.getInstance().getTime())) + " ********");
	}
}
