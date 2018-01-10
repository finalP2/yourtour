package net.nigne.yourtour.area;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class AreaValidator implements Validator {

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required");
	}
	
	@Override
	public boolean supports(Class<?> clazz) {
		return AreaModel.class.isAssignableFrom(clazz);
	}

}
