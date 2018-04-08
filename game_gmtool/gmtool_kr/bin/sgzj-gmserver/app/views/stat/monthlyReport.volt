{{ partial('custom_ui/server_select') }}
<script type="text/javascript" charset="utf-8">
webix.ready(function () {

var event_handler = {
    onSubmitGetMonthlyReport: function() {
        var form = $$("form:get_monthly_report");
        if (form.validate() === false) {
            return;
        }

        webix.ajax().sync().get(
            "{{ url('stat/get_monthly_report') }}",
            form.getValues(),
            function (text, data) {
                var ret = data.json();
                if (!ret) {
                    return;
                }
                if (ret.monthly_report_list) {
                    $$("table:monthly_report").clearAll();
                    $$("table:monthly_report").parse(ret.monthly_report_list);
                    $$("table:monthly_report").getFilter("channel").value = "";
                    webix.alert("조회성공");
                } else if (ret.error_code) { 
                    webix.alert(
                        enjoymi.getErrorMessage(ret.error_code));
                }
            }
        );
    },
};

var get_monthly_report_form = {
    id: "form:get_monthly_report",
    view: "form",
    width: 600,
    elements: [
        { view: "custom_server_select", name: "server_id",
          label: "서버", required: true },
        { view: "button", label: "조회", width: 100, align: "right",
          click: event_handler.onSubmitGetMonthlyReport },
    ],
};

var monthly_report_list_pager = {
    id: "pager:monthly_report_list",
    view: "pager",
    template: "{common.first()} {common.prev()} " +
              "{common.pages()} " +
              "{common.next()} {common.last()}",
};

var monthly_report_list = {
    id: "table:monthly_report",
    view: "datatable",
    width: 1024,
    columns: [
        { id: "timestamp", header: "일자", width: 100 },
        { id: "channel", header: ["플랫폼", { content: "selectFilter" }],
          width: 200 },
        { id: "monthly_new_users", header: "월신규" },
        { id: "monthly_active_users", header: "MAU" },
        { id: "monthly_revenue", header: "월충전금액" },
        { id: "monthly_pay_times", header: "월충전횟수" },
        { id: "monthly_pay_users", header: "월충전유저수", width: 120 },
        { id: "monthly_pay_rate", header: "월결제율" },
        { id: "monthly_arpu", header: "ARPU" },
        { id: "monthly_arppu", header: "ARPPU" },
    ],
    pager: "pager:monthly_report_list",
    autoheight: true,
    autowidth: true,
};

var monthly_report_list_export = {
    view: "button",
    label: "Excel에 저장",
    type: "icon",
    icon: "save",
    width: 100,
    click: function() {
        var filename = "월데이터표";
        webix.toExcel("table:monthly_report", {
            name: filename,
        });
    },
};

var layout = {
    rows: [
        { cols: [
            {},
            get_monthly_report_form,
            {},
        ]},
        monthly_report_list_export,
        monthly_report_list,
        monthly_report_list_pager,
    ],
};

$$("app:main_content").addView(layout);

});
</script>
