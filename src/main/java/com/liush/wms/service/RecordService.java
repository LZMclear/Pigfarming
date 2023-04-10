package com.liush.wms.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.liush.wms.entity.Record;


/**
 * <p>
 *  服务类
 * </p>
 *
 * @author wms
 * @since 2023-02-13
 */
public interface RecordService extends IService<Record> {

    IPage pageCC(IPage<Record> page, Wrapper wrapper);
}
