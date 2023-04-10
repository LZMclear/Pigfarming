package com.liush.wms.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.liush.wms.entity.Goods;
import com.liush.wms.mapper.GoodsMapper;
import com.liush.wms.service.GoodsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author wms
 * @since 2023-02-16
 */
@Service
public class GoodsServiceImpl extends ServiceImpl<GoodsMapper, Goods> implements GoodsService {

    @Resource
    private GoodsMapper goodsMapper;

    @Override
    public IPage pageCC(IPage<Goods> page, Wrapper wrapper) {
        return goodsMapper.pageCC(page, wrapper);
    }
}
