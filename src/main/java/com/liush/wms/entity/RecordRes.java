package com.liush.wms.entity;

import lombok.Data;

/**
 * <p>
 *
 * </p>
 *
 * @author wms
 * @since 2023-02-13
 */
@Data
public class RecordRes extends Record {

    private String username;
    private String adminname;
    private String goodsname;
    private String storagename;
    private String goodstypename;
}
