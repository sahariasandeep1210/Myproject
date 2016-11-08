package com.tf.services.dto;

import java.io.Serializable;
import java.util.Set;

public class PasswordReset  extends SuccessResponse implements Serializable {
    

    private static final long serialVersionUID = 6819644944769735549L;
    
    private Set<String> passwordReminderQuestions;
    private String passwordResetQuestion;
    private String passwordResetAnswer;
    
    public PasswordReset() {
	
    }

    public Set<String> getPasswordReminderQuestions() {
        return passwordReminderQuestions;
    }

    public void setPasswordReminderQuestions(Set<String> passwordReminderQuestions) {
        this.passwordReminderQuestions = passwordReminderQuestions;
    }

    public String getPasswordResetQuestion() {
        return passwordResetQuestion;
    }

    public void setPasswordResetQuestion(String passwordResetQuestion) {
        this.passwordResetQuestion = passwordResetQuestion;
    }

    public String getPasswordResetAnswer() {
        return passwordResetAnswer;
    }

    public void setPasswordResetAnswer(String passwordResetAnswer) {
        this.passwordResetAnswer = passwordResetAnswer;
    }
    
    

}
