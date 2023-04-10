package com.liush.wms.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.liush.wms.entity.Storage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author wms
 * @since 2023-02-16
 */
public interface StorageService extends IService<Storage> {

    IPage pageCC(IPage<Storage> page, Wrapper wrapper);
}
