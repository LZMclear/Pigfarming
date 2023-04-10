<template>
  <div style="display: flex;line-height: 60px">
    <div style="margin-top: 8px;">
      <i :class="icon" style="font-size: 20px;cursor: pointer;" @click="collapse"></i>
    </div>
    <div style="flex: 1;text-align: center;font-size: 34px;">
      <span>欢迎来到生猪养殖销售管理平台<DateUtils style="display: inline-block;padding-left: 20px;padding-top: 30px;"></DateUtils></span>
    </div>
    <el-dropdown>
      <span>{{ user.name }}</span>
      <i class="el-icon-arrow-down" style="margin-left: 5px"></i>
      <el-dropdown-menu slot="dropdown">
        <el-dropdown-item @click.native="toUser">个人中心</el-dropdown-item>
        <el-dropdown-item @click.native="logout">退出登录</el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>
    

  </div>
</template>

<script>
import DateUtils from "./DateUtils";
export default {
  name: "Header",
  components:{DateUtils},
  data() {
    return {
      user: sessionStorage.getItem('CurUser') && JSON.parse(sessionStorage.getItem('CurUser'))
    }
  },
  props: {
    icon: String
  },
  methods: {
    toUser() {
      alert("个人中心详情")
      this.$router.push("/Home")
    },
    logout() {
      this.$confirm('您确定要退出登录吗?', '提示', {
        confirmButtonText: '确定',  //确认按钮的文字显示
        type: 'warning',
        center: true, //文字居中显示
      }).then(() => {
        this.$message({
          type: 'success',
          message: '退出登录成功'
        })
        this.$router.push("/")
        sessionStorage.clear()
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消退出登录'
        })
      })
    },
    collapse() {
      this.$emit('doCollapse')
    }
  },
  created() {
    this.$router.push("/Home")
  }
}
</script>

<style scoped>

</style>