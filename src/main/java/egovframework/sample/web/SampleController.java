package egovframework.sample.web;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import egovframework.sample.service.SampleDefaultVO;
import egovframework.sample.service.SampleService;
import egovframework.sample.service.SampleVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Controller
public class SampleController {

    @Resource(name = "sampleService")
	private SampleService sampleService;

	/**
	 * 목록 조회
	 */
	@RequestMapping("/boardList.do")
	public String selectSampleList(@ModelAttribute("searchVO") SampleDefaultVO searchVO, ModelMap model) throws Exception {

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());   //현재 페이지
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());   //페이지당 게시물 수
		paginationInfo.setPageSize(searchVO.getPageSize()); //하단 페이지 수

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> sampleList = sampleService.selectSampleList(searchVO);
		model.addAttribute("sampleList", sampleList);

		int totCnt = sampleService.selectSampleListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "/sample/boardList";
	}

    /**
     * 등록화면으로 이동
     */
    @RequestMapping(value = "/boardRegister.do", method = RequestMethod.GET)
    public String viewRegisterPage(@ModelAttribute("searchVO") SampleDefaultVO searchVO, ModelMap model) throws Exception {
        return "/sample/boardRegister";
    }

    /**
     * DB에 게시글 등록
     */
    @RequestMapping(value = "/boardRegister.do", method = RequestMethod.POST)
    public String insertSample(@ModelAttribute("searchVO") SampleDefaultVO searchVO, SampleVO sampleVO, ModelMap model) throws Exception {
        sampleService.insertSample(sampleVO);
        return "forward:/boardList.do";
    }

    /**
     * 수정화면으로 이동
     */
    @RequestMapping(value = "/boardUpdate.do", method = RequestMethod.GET)
    public String viewUpdatePage(@ModelAttribute("searchVO") SampleDefaultVO searchVO, SampleVO sampleVO,
                                 @RequestParam("selectedId") int id, ModelMap model) throws Exception {
        sampleVO.setId(id);
        model.addAttribute("sampleVO", sampleService.selectSample(sampleVO));
        return "/sample/boardUpdate";
    }

    /**
     * 게시글 수정
     */
    @RequestMapping(value = "/boardUpdate.do", method = RequestMethod.POST)
    public String updateSample(@ModelAttribute("searchVO") SampleDefaultVO searchVO, SampleVO sampleVO) throws Exception {
        sampleService.updateSample(sampleVO);
        return "forward:/boardList.do";
    }

    /**
     * 게시글 삭제
     */
    @RequestMapping(value = "/boardDelete.do", method = RequestMethod.POST)
    public String deleteSample(@ModelAttribute("searchVO") SampleDefaultVO searchVO, SampleVO sampleVO) throws Exception {
        sampleService.deleteSample(sampleVO);
        return "forward:/boardList.do";
    }
    
    /**
     * AxisJ용 게시판 화면
     */
    @RequestMapping(value="/axisjBoardList.do")
    public String selectSampleListUsingAxisJ(@ModelAttribute("searchVO") SampleDefaultVO searchVO, ModelMap model) {
    	return "/sample/axisjBoardList";
    }
    
    /**
	 * AxisJ용 목록 조회
	 */
	@RequestMapping(value = "/getBoardList.do", method = RequestMethod.POST)
	public @ResponseBody List<?> axisjSelectSampleList(@RequestBody SampleDefaultVO searchVO) throws Exception {
		return sampleService.axisSelectSampleList(searchVO);
	}
	
	/**
     * AxisJ용 등록화면으로 이동
     */
    @RequestMapping(value = "/axisjBoardRegister.do", method = RequestMethod.GET )
    public String axisjViewRegisterPage(@ModelAttribute("searchVO") SampleDefaultVO searchVO, ModelMap model) throws Exception {
        return "/sample/axisjBoardRegister";
    }
    
    /**
     * AxisJ용 DB에 게시글 등록
     */
    @RequestMapping(value = "/axisjBoardRegister.do", method = RequestMethod.POST )
    public @ResponseBody boolean axisjInsertSample(@RequestBody SampleVO sampleVO) throws Exception {
    	Integer id = sampleService.insertSample(sampleVO);
    	boolean isSuccess = id != null ? true : false;
    	return isSuccess;
    }
    
    /**
     * AxisJ용 수정화면으로 이동
     */
    @RequestMapping(value = "/axisjBoardUpdate.do", method = RequestMethod.GET)
    public String axisjViewUpdatePage(@ModelAttribute("searchVO") SampleDefaultVO searchVO, SampleVO sampleVO,
                                 @RequestParam("selectedId") int id, ModelMap model) throws Exception {
        sampleVO.setId(id);
        model.addAttribute("sampleVO", sampleService.selectSample(sampleVO));
        return "/sample/axisjBoardUpdate";
    }
    
    /**
     * AxisJ용 게시글 수정
     */
    @RequestMapping(value = "/axisjBoardUpdate.do", method = RequestMethod.POST)
    public @ResponseBody boolean axisjUpdateSample(@RequestBody SampleVO sampleVO) throws Exception {
        int cnt = sampleService.updateSample(sampleVO);
        boolean isSuccess;
        //업데이트 성공시
        if(cnt == 1) {
        	isSuccess = true;
        } 
        //실패
        else {
        	isSuccess = false;
        }
        return isSuccess;
    }
}
