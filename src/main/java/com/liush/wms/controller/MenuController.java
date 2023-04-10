package com.liush.wms.controller;

import com.liush.wms.common.Result;
import com.liush.wms.entity.Menu;
import com.liush.wms.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author wms
 * @since 2023-02-13
 */
@RestController
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    @GetMapping("/list")
    public Result list(@RequestParam String roleId) {
        List list = menuService.lambdaQuery().like(Menu::getMenuright, roleId).list();
        return Result.suc(list);
    }
}
