package com.guro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guro.mapper.SpringTestMapper;

@Service

public class SpringTestService {

@Autowired

SpringTestMapper sm;

public int springTestCountService() {

return sm.test();

}

}