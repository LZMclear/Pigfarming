<template>
    <div id="main1" style="height:320px;width: 750px;">
    </div>
</template>

<script lang="ts">
import * as echarts from 'echarts';

export default{
    name:"FarmTable",
    methods:{
        initCharts(){
            var chartDom = document.getElementById('main1');
            var myChart = echarts.init(chartDom);
            var option;

            option = {
                title: {
                    text: '养殖场环境信息统计表'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: ['temperature', 'humidity', 'density']//三条线
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                toolbox: {
                    feature: {
                    saveAsImage: {}
                    }
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: ['养殖场1', '养殖场2', '养殖场3', '养殖场4', '养殖场5', '养殖场6']
                },
                yAxis: {
                    type: 'value'
                },
                series: [
                    {
                    name: 'temperature',
                    type: 'line',
                    stack: 'Total',
                    data: [26, 27, 26, 30, 25, 30]
                    },
                    {
                    name: 'humidity',
                    type: 'line',
                    stack: 'Total',
                    data: [80, 60, 60, 85, 67, 73]
                    },
                    {
                    name: 'density',
                    type: 'line',
                    stack: 'Total',
                    data: [1.2, 0.6, 1.4, 2.0, 1.2, 1.0]
                    },
                ]
            };

            option && myChart.setOption(option);
        }
    },
    mounted(){
        this.initCharts()
    }
}
</script>

<style scoped>

</style>