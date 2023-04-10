<template>
    <div>
        <el-table
            ref="singleTable"
            :data="tableData"
            highlight-current-row
            @current-change="handleCurrentChange"
            style="width: 100%">
            <el-table-column type="index" width="50">
            </el-table-column>
            <el-table-column property="date" label="日期" width="120">
            </el-table-column>
            <el-table-column property="name" label="姓名" width="120">
            </el-table-column>
            <el-table-column property="address" label="手机号">
            </el-table-column>
            <el-table-column prop="operate" label="操作">
                <template slot-scope="scope">
                <el-button size="small" type="success" @click="mod(scope.row)">编辑</el-button>
                <el-popconfirm
                    title="确定删除吗？"
                    @confirm="del(scope.row.id)"
                    style="margin-left: 5px;">
                    <el-button slot="reference" size="small" type="danger">删除</el-button>
                </el-popconfirm>
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>

<script lang="ts">
export default {
    data() {
      return {
        tableData: [],
        currentRow: null,
        pageSize: 5,
        pageNum: 1,
        total: 0,
        form: {
            id: '',
            name: '',
            storage: '',
            goodstype: '',
            count: '',
            remark: ''
        },
      }
    },

    methods: {
      setCurrent(row) {
        this.$refs.singleTable.setCurrentRow(row);
      },
      handleCurrentChange(val) {
        this.currentRow = val;
      },
      del(id) {
        console.log(id)
        this.$axios.get(this.$httpUrl + '/wms/storage/del?id=' + id).then(res => res.data).then(res => {
            console.log(res)
            if (res.code == 200) {

            this.$message({
                message: '操作成功！',
                type: 'success'
            });
            this.loadPost()
            } else {
            this.$message({
                message: '操作失败！',
                type: 'error'
            });
            }

        })
    },
    mod(row) {
      this.centerDialogVisible = true
      this.$nextTick(() => {
        //赋值到表单
        this.form.id = row.id
        this.form.name = row.name
        this.form.remark = row.remark
        this.form.temperature= row.temperature
        this.form.humidity=row.humidity
        this.form.density=row.density
      })
    },
    loadPost() {
      this.$axios.post(this.$httpUrl + '/wms/storage/listPage', {
        pageSize: this.pageSize,
        pageNum: this.pageNum,
        param: {
          name: this.name
        }
      }).then(res => res.data).then(res => {
        console.log(res)
        if (res.code == 200) {
          this.tableData = res.data
          this.total = res.total
        } else {
          alert('获取数据失败')
        }

      })
    }
    }
  }
</script>
<style scoped>

</style>
