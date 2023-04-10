package com.liush.wms.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.liush.wms.entity.User;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author wms
 * @since 2023-02-07
 */
public interface UserService extends IService<User> {

    IPage pageC(IPage<User> page);

    IPage pageCC(IPage<User> page, Wrapper wrapper);

}
