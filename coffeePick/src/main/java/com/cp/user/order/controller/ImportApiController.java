package com.cp.user.order.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class ImportApiController {

	private IamportClient api;

	public ImportApiController() {
		// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
		String APIKey = "1151505726578537";
		String APISecret = "hDhutPolOSdVp5OLRwAsBYoXwasydwvt8Ty56ly9uB302oL6HwLwBz81pMs1pOCOgaugaH8YtTgEMQtc";
		this.api = new IamportClient(APIKey, APISecret);
	}

	@ResponseBody
	@RequestMapping(value = "/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(Model model, Locale locale, HttpSession session,
			@PathVariable(value = "imp_uid") String imp_uid) throws IamportResponseException, IOException {
		return api.paymentByImpUid(imp_uid);
	}
}