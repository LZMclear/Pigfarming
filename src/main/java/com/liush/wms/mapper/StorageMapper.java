package com.liush.wms.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.liush.wms.entity.Storage;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author wms
 * @since 2023-02-16
 */
@Mapper
public interface StorageMapper extends BaseMapper<Storage> {

    IPage pageCC(IPage<Storage> page, @Param(Constants.WRAPPER) Wrapper wrapper);
}
