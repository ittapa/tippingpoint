package kr.pe.tippingpoint.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.pe.tippingpoint.service.TpNoticeService;
import kr.pe.tippingpoint.vo.TpNotice;

@Controller
public class TpNoticeController {
	

	@Autowired
	private TpNoticeService service;
	

//	// 전송TEST 지울것..
//	@RequestMapping("/test.tp")
//	public String submit(@RequestParam String tppProjectContent) {
//		System.out.println("내용" + tppProjectContent);
//		System.out.println();
//		System.out.println();
//
//		return "/WEB-INF/view/body/tpProject/tpProjectRequestSuccess.jsp";
//	}
//	
//	// 프로젝트등록 컨트롤러
//		@RequestMapping("/submitTpProject.tp")
//		public String registerTpProject(@ModelAttribute TpProject tpvo, @RequestParam MultipartFile upfile, HttpServletRequest request, ModelMap map)
//				throws IOException {
//			
//			System.out.println("라인1"+tpvo);
//			
//			//승인요청 a:저장, b: 승인요청,o:승인완료, x승인거부
//			tpvo.setTppState("b"); 
//			
//			tpvo.setTppWriter("작성자ID"); //session ID추출해서넣기
//			
//			//작성일자
//			Date date = new Date();
//			String day = date.getYear() - 100 + "" + (date.getMonth() + 1) + "" + date.getDate() + "" + date.getHours();
//			int days = Integer.parseInt(day);
//			
//			//작성일자 vo에 넣기
//			tpvo.setTppWriteDate(days);
//	
//			/////////////////// 정보 입력 끝 이미지 경로 빼고///////////////////////////////////////
//			
//			
//			////////// main image 처리////////////////////
//			
//			// null : upImage name의 요청파라미터가 아야 없는 경우.
//			// isEmpty -true: 사용자가 파일을 전송하지 않은 경우.
//			
//			if (upfile != null && !upfile.isEmpty()) { // 업로드된 파일이 있다.
//				// 업로드 된 파일으 ㅣ정보를 조회
//				// 파일을 임시저장경로에서 최종 저장경로로 이동.
//			
//				String mainImgName = upfile.getOriginalFilename(); //이미지 원래 이름
//				long fileSize = upfile.getSize();
//				System.out.println(mainImgName + " - " + fileSize);
//
//				
//		
//				// 이미지이므로 신규 파일로 디렉토리 설정 및 업로드
//				// 파일 기본경로
//				String dftFilePath = request.getSession().getServletContext().getRealPath("/");
//				
//				// 파일 기본경로 _ 상세경로
//				String filePath_A = "resources" + File.separator + "project" + File.separator + "mainImage"
//						+ File.separator;
//				// 파일 기본경로 _ 상세경로
//				String filePath = dftFilePath + filePath_A;
//				
//	
//				System.out.println("메인이미지 저장경로"+filePath);
//				File file = new File(filePath);
//				//메인 이미지 저장경로 설정....
//				
//				//있는지 확인하고 만들기
//				if (!file.exists()) {
//					file.mkdirs();
//				}
//				
//				long timeMilis = System.currentTimeMillis(); // 현재 시간
//				
//				String realMainImgName = tpvo.getTppId()+timeMilis+mainImgName;
//				System.out.println("miain이미지 이름 저장되는 이름"+realMainImgName);
// 
//				//저장설정
//				File upImg = new File(filePath, realMainImgName);
//
//				// 임시경로에서 레알로 저장하기
//				upfile.transferTo(upImg);
//				//메인이미지 경로 저장
//				tpvo.setTppMainImg("/TippingPoint/"+filePath_A+realMainImgName); //upfile
//			}else{
//				//이미지 안넣었을때 디폴트 이미지
//				tpvo.setTppMainImg("/TippingPoint/test/Desert.jpg");
//			}
//			
//
//			System.out.println("-----------------------------------------------");
//			System.out.println(tpvo);
//			//비즈니스 로직 처리하기 서비스
//			service.registerTpProject(tpvo);
//
//			return "/WEB-INF/view/body/tpProject/tpProjectRequestSuccess.jsp"; //성공페이지
//		}
//	
//	
//
//	// 사진 첨부하기 (html5가 아닐경우)
//	@RequestMapping("/file_uploader.tp")
//	public String file_uploader(HttpServletRequest request, HttpServletResponse response, Editor editor) {
//		String return1 = request.getParameter("callback");
//		String return2 = "?callback_func=" + request.getParameter("callback_func");
//		String return3 = "";
//		String name = "";
//		try {
//			if (editor.getFiledata() != null && editor.getFiledata().getOriginalFilename() != null
//					&& !editor.getFiledata().getOriginalFilename().equals("")) {
//				// 기존 상단 코드를 막고 하단코드를 이용
//				name = editor.getFiledata().getOriginalFilename()
//						.substring(editor.getFiledata().getOriginalFilename().lastIndexOf(File.separator) + 1);
//				String filename_ext = name.substring(name.lastIndexOf(".") + 1);
//				filename_ext = filename_ext.toLowerCase();
//				String[] allow_file = { "jpg", "png", "bmp", "gif" };
//				int cnt = 0;
//				for (int i = 0; i < allow_file.length; i++) {
//					if (filename_ext.equals(allow_file[i])) {
//						cnt++;
//					}
//				}
//				if (cnt == 0) {
//					return3 = "&errstr=" + name;
//				} else {
//					// 파일 기본경로
//					String dftFilePath = request.getSession().getServletContext().getRealPath("/");
//					// 파일 기본경로 _ 상세경로
//					String filePath = dftFilePath + "resources" + File.separator + "editor" + File.separator + "upload"
//							+ File.separator;
//					File file = new File(filePath);
//					if (!file.exists()) {
//						file.mkdirs();
//					}
//					String realFileNm = "";
//					SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
//					String today = formatter.format(new java.util.Date());
//					realFileNm = today + UUID.randomUUID().toString() + name.substring(name.lastIndexOf("."));
//					String rlFileNm = filePath + realFileNm;
//					///////////////// 서버에 파일쓰기 /////////////////
//					editor.getFiledata().transferTo(new File(rlFileNm));
//					///////////////// 서버에 파일쓰기 /////////////////
//					return3 += "&bNewLine=true";
//					return3 += "&sFileName=" + name;
//					return3 += "&sFileURL=/TippingPoint/resources/editor/upload/" + realFileNm;
//				}
//			} else {
//				return3 += "&errstr=error";
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "redirect:" + return1 + return2 + return3;
//	}
//
//	// 사진 첨부하기html5
//	@RequestMapping("/fuh5.tp")
//	public void file_uploader_html5(HttpServletRequest request, HttpServletResponse response) {
//		System.out.println("왜안오니");
//		try {
//			// 파일정보
//			String sFileInfo = "";
//			// 파일명을 받는다 - 일반 원본파일명
//			String filename = request.getHeader("file-name");
//
//			// 파일 확장자
//			String filename_ext = filename.substring(filename.lastIndexOf(".") + 1);
//			// 확장자를소문자로 변경
//			filename_ext = filename_ext.toLowerCase();
//
//			// 이미지 검증 배열변수
//			String[] allow_file = { "jpg", "png", "bmp", "gif" };
//
//			// 돌리면서 확장자가 이미지인지
//			int cnt = 0;
//			for (int i = 0; i < allow_file.length; i++) {
//				if (filename_ext.equals(allow_file[i])) {
//					cnt++;
//				}
//			}
//
//			// 이미지가 아님
//			if (cnt == 0) {
//				PrintWriter print = response.getWriter();
//				print.print("NOTALLOW_" + filename);
//				print.flush();
//				print.close();
//			} else {
//				// 이미지이므로 신규 파일로 디렉토리 설정 및 업로드
//				// 파일 기본경로
//				String dftFilePath = request.getSession().getServletContext().getRealPath("/");
//
//				// 파일 기본경로 _ 상세경로
//				String filePath = dftFilePath + "resources" + File.separator + "editor" + File.separator + "multiupload"
//						+ File.separator;
//				File file = new File(filePath);
//
//				if (!file.exists()) {
//					file.mkdirs();
//				}
//				String realFileNm = "";
//				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
//				
//				String today = formatter.format(new java.util.Date()); //현재 날자 시간을  네임에 담기
//				
//				realFileNm = today + UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
//			
//				String rlFileNm = filePath + realFileNm;
//				///////////////// 서버에 파일쓰기 /////////////////
//				InputStream is = request.getInputStream();
//				OutputStream os = new FileOutputStream(rlFileNm);
//				int numRead;
//				byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
//				while ((numRead = is.read(b, 0, b.length)) != -1) {
//					os.write(b, 0, numRead);
//				}
//				if (is != null) {
//					is.close();
//				}
//				os.flush();
//				os.close();
//				///////////////// 서버에 파일쓰기 /////////////////
//
//				// 정보 출력
//				sFileInfo += "&bNewLine=true";
//				// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
//				sFileInfo += "&sFileName=" + filename;
//				;
//				sFileInfo += "&sFileURL=" + "/TippingPoint/resources/editor/multiupload/" + realFileNm;
//				PrintWriter print = response.getWriter();
//				print.print(sFileInfo);
//				print.flush();
//				print.close();
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}

	

	// 공지사항 전체보기(리스트)
	@RequestMapping("/tpNoticeBoard")
	public ModelAndView tpNoticeBoard (HttpServletRequest request, HttpServletResponse response) throws Exception{
		int pageNo = 1;
		try {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		} catch (Exception e) {
		}

		Map map = service.allListTpNotice(pageNo);
		
		return new ModelAndView("/WEB-INF/view/body/tpNotice/tpNoticeList.jsp", map);
	}
	
	
	

	// 공지사항 상세보기
	@RequestMapping("/findTpNotice")
	public ModelAndView findTpNotice(HttpServletRequest request, HttpServletResponse response) {

		// 1.요청파라미터 조회

		String num = request.getParameter("tpNoticeNum");
		int tpNoticeNum = Integer.parseInt(num);
		TpNotice noticeList = service.findTpNoticeNum(tpNoticeNum);

		return new ModelAndView("/WEB-INF/view/body/tpNotice/tpNoticeView.jsp", "noticeList", noticeList);
	}


}
