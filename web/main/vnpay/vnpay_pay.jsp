<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Tạo mới đơn hàng</title>
        <!-- Bootstrap core CSS -->
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="/vnpay_jsp/assets/jumbotron-narrow.css" rel="stylesheet">      
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </head>

    <body>

        <div class="container">
            <div class="header clearfix">
                <h3 class="text-muted">VNPAY DEMO</h3>
            </div>

            <h3>Tạo mới đơn hàng</h3>

            <div class="table-responsive">
                <form action="/vnpay_jsp/vnpayajax" id="frmCreateOrder" method="post">
                    <div class="form-group">
                        <label for="amount">Số tiền</label>
                        <input class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" max="100000000" min="1" name="amount" type="number" value="10000" />
                    </div>

                    <h4>Chọn phương thức thanh toán</h4>
                    <div class="form-group">
                        <div class="form-check">
                            <input type="radio" class="form-check-input" checked="true" id="bankCode1" name="bankCode" value="">
                            <label class="form-check-label" for="bankCode1">Cổng thanh toán VNPAYQR</label>
                        </div>

                        <div class="form-check">
                            <input type="radio" class="form-check-input" id="bankCode2" name="bankCode" value="VNPAYQR">
                            <label class="form-check-label" for="bankCode2">Thanh toán bằng ứng dụng hỗ trợ VNPAYQR</label>
                        </div>

                        <div class="form-check">
                            <input type="radio" class="form-check-input" id="bankCode3" name="bankCode" value="VNBANK">
                            <label class="form-check-label" for="bankCode3">Thanh toán qua thẻ ATM/Tài khoản nội địa</label>
                        </div>

                        <div class="form-check">
                            <input type="radio" class="form-check-input" id="bankCode4" name="bankCode" value="INTCARD">
                            <label class="form-check-label" for="bankCode4">Thanh toán qua thẻ quốc tế</label>
                        </div>
                    </div>

                    <div class="form-group">
                        <h5>Chọn ngôn ngữ giao diện thanh toán:</h5>
                        <div class="form-check">
                            <input type="radio" class="form-check-input" checked="true" id="language1" name="language" value="vn">
                            <label class="form-check-label" for="language1">Tiếng việt</label>
                        </div>

                        <div class="form-check">
                            <input type="radio" class="form-check-input" id="language2" name="language" value="en">
                            <label class="form-check-label" for="language2">Tiếng anh</label>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary">Thanh toán</button>
                </form>
            </div>

            <p>&nbsp;</p>

            <footer class="footer">
                <p>&copy; VNPAY 2020</p>
            </footer>
        </div>

        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script type="text/javascript">
            $("#frmCreateOrder").submit(function () {
                var postData = $("#frmCreateOrder").serialize();
                var submitUrl = $("#frmCreateOrder").attr("action");
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'JSON',
                    success: function (x) {
                        if (x.code === '00') {
                            if (window.vnpay) {
                                vnpay.open({width: 768, height: 600, url: x.data});
                            } else {
                                location.href = x.data;
                            }
                            return false;
                        } else {
                            alert(x.Message);
                        }
                    }
                });
                return false;
            });
        </script>       
    </body>
</html>