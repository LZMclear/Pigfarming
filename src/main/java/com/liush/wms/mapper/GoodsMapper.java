package com.liush.wms.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;

import com.liush.wms.entity.Goods;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author wms
 * @since 2023-02-13
 */
@Mapper
public interface GoodsMapper extends BaseMapper<Goods> {

    IPage pageCC(IPage<Goods> page, @Param(Constants.WRAPPER) Wrapper wrapper);
}
