package kr.or.ddit.groupware.contoller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import kr.or.ddit.groupware.model.EmpVo;
import kr.or.ddit.groupware.service.EmpService;



@Controller
@ServerEndpoint(value="/echo.do")
public class ChatingController {
	


	@Resource(name="empService")
	private EmpService empService;
	
	
	private static final List<Session> sessionList=new ArrayList<Session>();;
    private static final Logger logger = LoggerFactory.getLogger(ChatingController.class);
    public ChatingController() {
        // TODO Auto-generated constructor stub
        System.out.println("웹소켓(서버) 객체생성");
    }
    
    @OnOpen
    public void onOpen(Session session) {
        logger.info("Open session id:"+session.getId());
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("대화방에 연결 되었습니다.");
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        sessionList.add(session);
    }
    
    /*
     * 모든 사용자에게 메시지를 전달한다.
     * @param self
     * @param sender
     * @param message
     */
    private void sendAllSessionToMessage(Session self, String sender, String message) {
    	
        try {
            for(Session session : ChatingController.sessionList) {
                if(!self.getId().equals(session.getId())) {
                    session.getBasicRemote().sendText(sender+" : "+message);
                }
            }
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
    }
    
    /*
     * 내가 입력하는 메세지
     * @param message
     * @param session
     */
    @OnMessage
    public void onMessage(String message,Session session) {
    	
    	String sender = message.split(",")[1];
    	message = message.split(",")[0];
    	
        logger.info("Message From "+sender + ": "+message);
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("<나> : "+message);
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        sendAllSessionToMessage(session, sender, message);
    }
    
    @OnError
    public void onError(Throwable e,Session session) {
        
    }
    
    @OnClose
    public void onClose(Session session) {
        logger.info("Session "+session.getId()+" has ended");
        sessionList.remove(session);
    }
	
	
	
	
	
	
	
//	private static final List<Session> sessionList=new ArrayList<Session>();;
//    private static final Logger logger = LoggerFactory.getLogger(ChatingController.class);
//    public ChatingController() {
//        // TODO Auto-generated constructor stub
//        System.out.println("웹소켓(서버) 객체생성");
//    }
//    
//    @OnOpen
//    public void onOpen(Session session) {
//    	
//    	boolean chatFlag = true;
//    	
//    	for(int i = 0; i<EmpController.chatEmpList.size(); i++) {
//    		logger.info("userCheck() chatEmpList.get(i).getEmp_no() : {} ",EmpController.chatEmpList.get(i).getEmp_no());
//    		for(int j = 0; j<EmpController.checkEmpList.size(); j++)
//    		if(EmpController.chatEmpList.get(i).getEmp_no() == EmpController.checkEmpList.get(j)) {
//    			logger.info("userCheck() checkEmpList.get(j) : {} ",EmpController.checkEmpList.get(j));
//    			chatFlag = false;
//    		}
//    	}
//    	if(chatFlag) {
//        logger.info("Open session id:"+session.getId());
//        try {
//            final Basic basic=session.getBasicRemote();
////            basic.sendText("대화방에 연결 되었습니다.");
//        }catch (Exception e) {
//            // TODO: handle exception
//            System.out.println(e.getMessage());
//        }
//        EmpController.chatEmpList.add(empService.selectEmpDetail(EmpController.checkEmpList.get(EmpController.checkEmpList.size()-1)));
//        logger.info("chatEmpList접속 : {} ",EmpController.chatEmpList);
//        sessionList.add(session);
//        logger.info("sessionList접속 : {} ",sessionList);
//    	}
//    }
//    public void adduserList(Session session){
//    	
//    }
//    
//    
//    @RequestMapping("userCheck")
//    public String userCheck(int emp_no,Model model){
//    	int cnt = 0;
//    	logger.info("userCheck() emp_no : {} ",emp_no);
//    	boolean checkCnt = true;
//    	for(int i=0; i<EmpController.checkEmpList.size(); i++) {
//    		if(EmpController.checkEmpList.get(i) == emp_no) {
//    			checkCnt = false;
//    		}
//    	}
//    	if(checkCnt) {
//    		EmpController.checkEmpList.add(emp_no);
//    		cnt = 1;
//    	}
//    	
//    	logger.info("userCheck() checkEmpList : {} ",EmpController.checkEmpList);
//    	
//    	model.addAttribute("checkCnt", cnt);
//    	
//    	return "jsonView";
//    }
//    
//    /*
//     * 모든 사용자에게 메시지를 전달한다.
//     * @param self
//     * @param sender
//     * @param message
//     */
//    private void sendAllSessionToMessage(Session self, String userId,  String sender, String message) {
//    	
//    	
//        try {
//            for(Session session : ChatingController.sessionList) {
//            	HttpSession httpSession = (HttpSession)session;
//            	logger.info("받는이 정보 : "+session.getId());
//            	logger.info("session 정보 : "+session.getId());
//                if(userId.equals(httpSession.getAttribute("S_USER"))) {
//                    session.getBasicRemote().sendText(sender+" : "+message);
//                }
//            }
//        }catch (Exception e) {
//            // TODO: handle exception
//            System.out.println(e.getMessage());
//        }
//    }
//    
//    /*
//     * 내가 입력하는 메세지
//     * @param message
//     * @param session
//     */
//    @OnMessage
//    public void onMessage(String message,Session session) {
//    	logger.info("omMessage 진입 성공");
//    	String sender = message.split(",")[1];
//    	String recipient = message.split(",")[2];
//    	message = message.split(",")[0];
//    	logger.info("Message From "+sender + ": "+message+ " : "+recipient);
//        logger.info("Message From "+sender + ": "+message+ " : "+recipient);
//        try {
//            final Basic basic=session.getBasicRemote();
//            basic.sendText("<나> : "+message);
//        }catch (Exception e) {
//            // TODO: handle exception
//            System.out.println(e.getMessage());
//        }
//        sendAllSessionToMessage(session, recipient, sender, message);
//    }
//    
//    @OnError
//    public void onError(Throwable e,Session session) {
//        
//    }
//    
//    @OnClose
//    public void onClose(Session session) {
//        logger.info("Session "+session.getId()+" has ended");
//        sessionList.remove(session);
//        logger.info("Session sessionList : {}",sessionList);
//    }
	
	
}
