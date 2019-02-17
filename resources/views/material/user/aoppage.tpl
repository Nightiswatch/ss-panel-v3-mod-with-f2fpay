 <div class="card-inner">
 <div class="row">
        <div class="col-lg-6 col-md-6">
            <p class="card-heading">支付宝在线充值</p>
            <div class="form-group form-group-label">
                <label class="floating-label" for="amount">金额</label>
                <input class="form-control" id="amount" type="text" >
            </div>
        </div>
        <div class="col-lg-6 col-md-6">
            <div class="h5 margin-top-sm text-black-hint" id="qrarea"></div>
        </div>
    </div>
</div>
    <a class="btn btn-flat waves-attach" id="pay" onclick="pay();" ><span class="icon">check</span>&nbsp;充值</a>
<script>
    var pid = 0;
    function pay(){
        $("#readytopay").modal();
        $("#readytopay").on('shown.bs.modal', function () {
            $.ajax({
                type: "POST",
                url: "/user/payment/purchase",
                dataType: "json",
                data: {
                    amount: $("#amount").val()
                },
                success: function (data) {
                    if (data.ret)
                        window.location.href = data.url;
                    } else {
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    console.log(jqXHR);
                    $("#readytopay").modal('hide');
                    $("#result").modal();
                    $("#msg").html(jqXHR+"  发生了错误。");
                }
            })
        });
    }

</script>
