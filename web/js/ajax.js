//movie==========
function handleAjaxMain(element) {
//    console.log(element);
    let textTypeOfFilm = "";
    let paid = document.querySelector("input[name='isPaid']");
    let select = document.querySelector(".RC-search-header select");
    let input = document.querySelector(".RC-search_wrapper input");
    let selectSort = document.querySelector("select[name='sort-select']");
    let xTypeOfFilm = document.querySelectorAll("input[name='typeOfFilm']:checked");
    let xTypeOfFilmTmp = Array.from(xTypeOfFilm);

    xTypeOfFilmTmp.forEach((type, index) => {
        textTypeOfFilm += type.value;
        if (index != xTypeOfFilm.length - 1)
            textTypeOfFilm += ",";
    })

    let parameters = {
        typeOfFilm: textTypeOfFilm,
        selectSort: selectSort.value,
        isPaid: paid.checked,
        selectSearch: select.value,
        inputSearch: input.value
    }

    if (element.closest('.RC-pagination a'))
        parameters.page = element.dataset.index;

    $.ajax({
        url: "/Movie_Web/search-movie",
        type: "post", //send it through get method
        data: parameters,
        success: function (data) {
            var row = document.querySelector(".right-content");
            row.innerHTML = data;
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}
function handleInputSubmit(event, element) {
    if (event.key == 'Enter') {
        event.preventDefault();
        handleAjaxMain(element);
    }
}

//shop-cart==========
// ket hop voi ajax de tranh nhieu request nen moi lam the nay,
// phan delete thi goi ajax
// handle with shop-card
function handleCheckAll(element) {
    // let cardItems = $$('.shopping-card-item')
    let checkItems = _$_$('input[name="item-index"]')

    for (let checkItem of checkItems) {
        checkItem.checked = element.checked;
    }
    handleMoneys()
}
function handleCheckItem(element) {
    let checkAll = _$('#markAll')
    let checkItems = _$_$('input[name="item-index"]')
    handleMoneys()
    for (let checkItem of checkItems) {
        if (!checkItem.checked) {
            checkAll.checked = false;
            return;
        }
    }
    checkAll.checked = true
}
function handleDelete(element) {
    deleteTarget = element.closest('.shopping-card-item')
    deleteParent = deleteTarget.closest('.shopping-card-list')
    deleteParent.removeChild(deleteTarget)
    handleMoneys()
    handleCountItem()
}
function handleMoneys() {
    let moneyPos = _$('.shopping-card-total span')
    let checkItems = _$_$('input[name="item-index"]')
    let stringMoneys = [], result
    for (let checkItem of checkItems) {
        if (checkItem.checked) {
            let parentElement = checkItem.closest('.shopping-card-item')
            if (parentElement.style.display != 'none') {
                let moneyPosTmp = parentElement.querySelector('.price-delete-wrapper p')
                stringMoneys.push(moneyPosTmp.innerHTML)
            }
        }
    }
    result = stringMoneys.reduce((pre, current) => {
        return pre + (Number(current.slice(1)))
    }, 0)
    moneyPos.innerHTML = `$${result}`;
}
function handleCountItem() {
    let countPos = _$('.SCL-heading span')
    let items = _$_$('.shopping-card-item')
    let num = 0;
    for (let item of items) {
        if (item.style.display != 'none')
            num += 1;
    }
    countPos.innerHTML = `${num} items`
}
function handleAfterCheckout(checkoutElements, MessType) {
    let cardMess = _$('.card-mess')
    let data = ''
    if (MessType == 'Success') {
        for (let checkoutElement of checkoutElements)
            handleDelete(checkoutElement)
        data = `<strong>Success!</strong> Buy successfully!.`
    } else if (MessType == 'Failure') {
        data = `<strong>Not enough money!</strong> You can't buy these films.`
    } else if (checkoutElements.length == 0) {
        data = `<strong>Error!</strong> You can't buy without any items.`
    }

    cardMess.innerHTML = `<div class="alert alert-warning alert-dismissible fade show" role="alert">
            ${data}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>`
}
function handleCheckout() {
    let checkoutBtn = _$('#checkout-btn')
    let closeBtn = checkoutBtn.parentElement.querySelector('.btn-secondary')

    checkoutBtn.onclick = () => {
        let checkItems = _$_$('input[name="item-index"]:checked')
        let moneyPos = _$('.shopping-card-total span')
        let idList = []
        for (let checkItem of checkItems) {
            idList.push(checkItem.dataset.id)
        }

        let parameters = {
            idList: idList.join(','),
            money: moneyPos.innerHTML.slice(1),
            action: 'check-out'
        }
        console.log(parameters)

        if (checkItems.length == 0)
            handleAfterCheckout(checkItems)
        else {
            //call api processData
            $.ajax({
                url: "/Movie_Web/shop-cart",
                type: "post", //send it through get method
                data: parameters,
                success: function (data) {
                    let res = data
                    console.log(res);
                    handleAfterCheckout(checkItems, res)
                },
                error: function (xhr) {
                    console.log("error");
                }
            });
        }

        closeBtn.click()
    }
}

//for search input with only js
function handleAjaxLoadMovieToHeader() {
    let cookies = document.cookie.split("; ")
    let cartCk = ''
    let targetAdd = document.querySelector('.MyCard-content')
                
    if(targetAdd){
        targetAdd.innerHTML = ''
    }
    for (let cookie of cookies) {
        if (cookie.startsWith('cart'))
            cartCk = cookie.split("=")[1];
    }
    
    if (cartCk != '') {
        $.ajax({
            url: "/Movie_Web/get-movie-sc",
            type: "post", //send it through get method
            data: {
                cartCk
            },
            success: function (data) {
                let resAll = data
                let resItems = resAll.split('/')
              
                for(let resItem of resItems){
                    let id = resItem.split(':')[0]
                    let src = resItem.split(':')[1]
                    let name = resItem.split(':')[2]
                    let distance = resItem.split(':')[3]
                    targetAdd.innerHTML += `
                        <div data-id="${id}" data-src="${src}"class="MyCard-content-item">
                            <a href="movie-detail?id=${id}">
                                <img src="https://i.ytimg.com/vi/${src}/maxresdefault.jpg">
                            </a>
                            <div class="card-film-info">
                                <h3><a href="movie-detail?id=${id}">${name}</a></h3>
                                <p class="card-last-access">Add cart at ${distance} day ago</p>
                                <div class="card-checkpay">
                                    <a href="shop-cart">Pay Now$</a>
                                </div>
                            </div>
                        </div>
                    `
                }
            },
            error: function (xhr) {
                //Do Something to handle error
                console.log("err");
            }
        });
    } else {
        if(targetAdd){
            targetAdd.innerHTML += `<span class="no-cart">No item in cart</span>`
        }
    }
}

function handldeSearchCart(element) {
    let items = _$_$('.shopping-card-item');
    let searhValue = element.value.toUpperCase();
    for (let item of items) {
        let name = item.querySelector('.card-film-info a').innerHTML.toUpperCase()
        let director = item.querySelector('.card-film-info p').innerHTML.toUpperCase()
        let dateCreated = item.querySelector('.card__film-created p').innerHTML.toUpperCase()
        let price = item.querySelector('.price-delete-wrapper p').innerHTML.toUpperCase()
        let isMatch = false;
        if (name.indexOf(searhValue) > -1 || director.indexOf(searhValue) > -1 || dateCreated.indexOf(searhValue) > -1 || price.indexOf(searhValue) > -1)
            isMatch = true;
        if (isMatch)
            item.style.display = ""
        else
            item.style.display = "none"
    }
    handleMoneys()
    handleCountItem()
}
function handleAjaxShopCart(element) {
    $.ajax({
        url: "/Movie_Web/shop-cart",
        type: "post", //send it through get method
        data: {
            id: element.dataset.id,
            action: 'handle-shopcart-cookie'
        },
        success: function (data) {
//            console.log(JSON.stringify(data));
            let dataRes = data
            if (dataRes == "add") {
                //for btn in movie detaiil
                if (element.closest('.btn_add-to-cart')) {
                    let textEle = element.querySelector('span')
                    textEle.innerHTML = 'CANCEL CART'
                } else
                    element.innerHTML = 'CANCEL CART'

                handleAjaxLoadMovieToHeader()
            }
            if (dataRes == "delete") {
                if (element.innerHTML == 'CANCEL CART') {
                    element.innerHTML = 'ADD TO CART'
                } else {
                    //for btn in movie detaiil
                    if (element.closest('.btn_add-to-cart')) {
                        let textEle = element.querySelector('span')
                        textEle.innerHTML = 'ADD TO CART'
                    }
                    //for trah in shop-card
                    else if (element.closest('.trash_delete-cart'))
                        handleDelete(element)
                }

                handleAjaxLoadMovieToHeader()
            }
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}


//movie-detail============
function handleAjaxLoadCmt(element) {
    let numOfCmt = document.querySelectorAll('.comment-list .comment-item').length;
    let filmId = element.dataset.id;
    let parameters = {numOfCmt, filmId, action: 'load'}

    $.ajax({
        url: "/Movie_Web/movie-detail",
        type: "post", //send it through get method
        data: parameters,
        success: function (data) {
            // khai bao bien kieu nay ~ JSON.stringify()
            let dataString = JSON.stringify(data)
            let dataLoadPos = document.querySelector('.comment__item-wrapper')
            if (dataString.indexOf('no-more') > -1) {
//                console.log(dataString);
                let newData = dataString.replace("|no-more", "")
                dataLoadPos.innerHTML += JSON.parse(newData)

                let elementPar = element.closest('.comment-list')
                elementPar.removeChild(element)
            } else {
                dataLoadPos.innerHTML += data
            }
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}
function handleAjaxAddCmt(e, element) {
    if (e.key == 'Enter') {
        let inputCmt = element.value;
        let uiId = element.dataset.uiid
        let mId = element.dataset.mid
        let parameters = {inputCmt, uiId, mId, action: 'add'}

//        console.log(parameters)
        $.ajax({
            url: "/Movie_Web/movie-detail",
            type: "post", //send it through get method
            data: parameters,
            success: function (data) {
                let dataLoadPos = document.querySelector('.comment__item-wrapper')
                dataLoadPos.innerHTML = data + dataLoadPos.innerHTML
                element.value = ''
                CountCmtAfterAdd()
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }
}
function CountCmtAfterAdd() {
    let countPos = document.querySelector('.MD__main-comment h1 span')
    let preCount = countPos.innerHTML
    countPos.innerHTML = Number(preCount) + 1
}

//admin-add-movie=============
function handleAjaxSearchDirector(element) {
    let action = "search-director"
    let inputSearch = element.value
    let parameters = {action, inputSearch}

    $.ajax({
        url: "/Movie_Web/admin-addmovie",
        type: "post", //send it through get method
        data: parameters,
        success: function (data) {
            var row = document.querySelector("#director-data .customm-tableBody");
            row.innerHTML = data;
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}

function handleAjaxSearchActor(element) {
    let action = "search-actor"
    let inputSearch = element.value
    let parameters = {action, inputSearch}

    $.ajax({
        url: "/Movie_Web/admin-addmovie",
        type: "post", //send it through get method
        data: parameters,
        success: function (data) {
            var row = document.querySelector("#actor-data .customm-tableBody");
            row.innerHTML = data;
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}

function handleAjaxSearchGenre(element) {
    let action = "search-genre"
    let inputSearch = element.value
    let parameters = {action, inputSearch}

    $.ajax({
        url: "/Movie_Web/admin-addmovie",
        type: "post", //send it through get method
        data: parameters,
        success: function (data) {
            var row = document.querySelector("#genre-data .customm-tableBody");
            row.innerHTML = data;
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}

//admin handle acc
function handleAjaxSearchAcc(element) {
    let select = document.querySelector("#inputGroupSelect01").value;
    let input = document.querySelector("#search-info").value;

    let parameters = {
        select,
        input,
        action: 'search-acc'
    }

    if (element.closest('#pagination li'))
        parameters.page = element.dataset.id;

    $.ajax({
        url: "/Movie_Web/admin-handleacc",
        type: "post", //send it through get method
        data: parameters,
        success: function (data) {
            var row = document.querySelector(".result_acc-wrapper");
            row.innerHTML = data;
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}

function handleAjaxChangeStateUserAcc(element) {
    let id = element.dataset.id
    let type = element.dataset.type

    let parameters = {
        id,
        type,
        action: 'update-state'
    }

    $.ajax({
        url: "/Movie_Web/admin-handleacc",
        type: "post", //send it through get method
        data: parameters,
        success: function (data) {
            var row = element.parentElement;
            row.innerHTML = data;
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}

