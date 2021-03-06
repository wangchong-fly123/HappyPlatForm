{{ partial('custom_ui/date_select') }}
<script type="text/javascript" charset="utf-8">
webix.ready(function () {

var event_handler = {
    onSubmitGetSpreadDailyReport: function() {
        var form = $$("form:get_all_daily_report");
        if (form.validate() === false) {
            return;
        }

        var params = form.getValues();
        params.end_date = params.start_date;
        params.spread = "";

        webix.ajax().sync().get(
            "{{ url('stat/get_spread_all_daily_report') }}",
            params,
            function (text, data) {
                var ret = data.json();
                if (!ret) {
                    return;
                }
                if (ret.spread_all_daily_report_list) {
                    $$("table:all_daily_report").clearAll();
                    $$("table:all_daily_report").parse(ret.spread_all_daily_report_list);
                    webix.alert("조회성공");
                } else if (ret.error_code) { 
                    webix.alert(
                        enjoymi.getErrorMessage(ret.error_code));
                }
            }
        );
    },
};

var start_date = new Date();
start_date.setDate(start_date.getDate() - 1);

var get_all_daily_report_form = {
    id: "form:get_all_daily_report",
    view: "form",
    width: 600,
    elements: [
        { id: "datepicker:start_date",
          view: "custom_date_select", name: "start_date",
          label: "일자", required: true, value: start_date },
        { view: "button", label: "조회", width: 100, align: "right",
          click: event_handler.onSubmitGetSpreadDailyReport },
    ],
};

var spread_all_daily_report_list_pager = {
    id: "pager:spread_all_daily_report_list",
    view: "pager",
    template: "{common.first()} {common.prev()} " +
              "{common.pages()} " +
              "{common.next()} {common.last()}",
};

var spread_all_daily_report_list = {
    id: "table:all_daily_report",
    view: "datatable",
    width: 1024,
    columns: [
        { id: "spread", header: "프로모션", width: 200 },
        { id: "daily_new_users", header: "일신규유저수",
          sort: "int" },
        { id: "daily_active_old_users", header: "신규 제거 DAU",
          sort: "int" },
        { id: "daily_active_users", header: "DAU",
          sort: "int" },
        { id: "daily_revenue", header: "일충전금액",
          sort: "int" },
        { id: "daily_pay_times", header: "일충전횟수",
          sort: "int" },
        { id: "daily_pay_users", header: "일충전유저수",
          width: 120, sort: "int" },
        { id: "new_pay_users", header: "신규 사용자 수",
          width: 120, sort: "int" },
        { id: "daily_pay_rate", header: "일결제율",
          sort: enjoymi.percentSortFunc("daily_pay_rate") },
        { id: "daily_new_user_revenue", header: "일신규유저충전금액",
          width: 150, sort: "int" },
        { id: "daily_new_user_pay_times", header: "일신규유저충전횟수",
          width: 150, sort: "int" },
        { id: "daily_new_user_pay_users", header: "일신규충전유저수",
          width: 160, sort: "int" },
        { id: "daily_new_user_pay_rate", header: "일신규유저결제율", width: 130,
          sort: enjoymi.percentSortFunc("daily_new_user_pay_rate") },
        { id: "daily_avg_online_time", header: "일평균사용시간(분)",
          width: 150, sort: "int" },
        { id: "daily_arpu", header: "ARPU",
          sort: "int" },
        { id: "daily_arppu", header: "ARPPU",
          sort: "int" },
    ],
    pager: "pager:spread_all_daily_report_list",
    autoheight: true,
};

var spread_all_daily_report_list_export = {
    view: "button",
    label: "Excel에 저장",
    type: "icon",
    icon: "save",
    width: 100,
    click: function() {
        var filename = "일데이터표(프로모션)";

        var start_date = $$("datepicker:start_date").getValue();
        if (start_date) {
            filename += "_" + start_date;
        }

        webix.toExcel("table:all_daily_report", {
            name: filename,
        });
    },
};

var layout = {
    rows: [
        { cols: [
            {},
            get_all_daily_report_form,
            {},
        ]},
        { cols: [
            {},
            { view: "label", css: "warnings", width: 600,
              label: "*경고*해당 기능은 게임서버 성능에 영향을 줄 수 있습니다, " +
                     "게임 피크타임에 빈번하게 조회하지 마시고 날자간격을 너무 길게 해서 조회하지 마세요." },
            {},
        ]},
        spread_all_daily_report_list_export,
        spread_all_daily_report_list,
        spread_all_daily_report_list_pager,
    ],
};

$$("app:main_content").addView(layout);

});
</script>
