package com.example.CRM_system.workbench.web.controller;

import com.example.CRM_system.commons.pojo.Result;
import com.example.CRM_system.commons.utils.DateTimeUtil;
import com.example.CRM_system.commons.utils.UUIDUtil;
import com.example.CRM_system.settings.pojo.User;
import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.req.ClueReq;
import com.example.CRM_system.workbench.pojo.Clue;
import com.example.CRM_system.workbench.service.ClueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ClueController {
    @Autowired
    private ClueService clueService;

    //条件查询线索列表
    @GetMapping("/workbench/clue/getClueList.do")
    @ResponseBody
    public Result getClueListByCondition(ClueReq clueReq){
        System.out.println("进入查询线索操作");

        //将默认的页数和每页展现条数强转为int类型
        Integer pageNo = Integer.valueOf(clueReq.getPageNoStr());
        Integer pageSize = Integer.valueOf(clueReq.getPageSizeStr());

        //计算出略过的记录数
        int skipCount = (pageNo - 1) * pageSize;
        clueReq.setSkipCount(skipCount);
        clueReq.setPageSize(pageSize);

        PaginationVO<Clue> clues = clueService.getClueListByCondition(clueReq);

        return Result.success(clues);
    }

    //根据id查询线索
    @RequestMapping("/workbench/clue/getClueById.do")
    @ResponseBody
    public Result getClueById(String id, HttpServletRequest req){
        System.out.println("根据id查询线索");

        Clue clueById = clueService.getClueById(id);

        req.getSession().setAttribute("clue", clueById);

        return Result.success(clueById);
    }

    //根据id查询线索
    @RequestMapping("/workbench/clue/getClueById02.do")
    @ResponseBody
    public Result getClueById02(String id, HttpServletRequest req){
        System.out.println("根据id查询线索");

        Clue clueById = clueService.getClueById02(id);

        req.getSession().setAttribute("clue", clueById);

        return Result.success(clueById);
    }

    //进行添加线索操作
    @PostMapping("/workbench/clue/addClue.do")
    @ResponseBody
    public Result addClue(Clue clue, HttpServletRequest req){
        System.out.println("进入添加线索操作");

        //额外添加线索id 创建时间 创建人
        String id = UUIDUtil.getUUID();
        String createTime = DateTimeUtil.getSysTime();
        String createBy = ((User)req.getSession().getAttribute("user")).getName();

        clue.setId(id);
        clue.setCreateTime(createTime);
        clue.setCreateBy(createBy);

        boolean flag = clueService.addClue(clue);

        if (flag){
            return Result.success();
        }else {
            return Result.error("500", "添加失败");
        }
    }

    //进行修改线索操作
    @PostMapping("/workbench/clue/updateClue.do")
    @ResponseBody
    public Result updateClue(Clue clue, HttpServletRequest req){
        System.out.println("进入修改操作");

        String updateTime = DateTimeUtil.getSysTime();
        String updateBy = ((User)req.getSession().getAttribute("user")).getName();

        clue.setEditTime(updateTime);
        clue.setEditBy(updateBy);

        boolean flag = clueService.updateClue(clue);

        if (flag){
            return Result.success();
        }else{
            return Result.error("500","修改失败");
        }
    }

    //进行删除线索
    @PostMapping("/workbench/clue/delClue.do")
    @ResponseBody
    public Result delClue(String[] ids){
        System.out.println("进入到删除线索操作");

        boolean flag = clueService.deleteClue(ids);

        if (flag){
            return  Result.success();
        }else {
            return Result.error("500", "删除失败");
        }
    }

    //请求转发，进入到线索详细信息页
    @RequestMapping("/workbench/clue/detail.do")
    public String clueDetail(String id, HttpServletRequest req){
        System.out.println("进入到线索详细信息页");

        //根据id查询线索
        Clue clue = clueService.getClueById(id);

        //将clue保存到session域中
        req.getSession().setAttribute("clue",clue);

        return "companyLogin/menu/clue/clueDetail";
    }
}
