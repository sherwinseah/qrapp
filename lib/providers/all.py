
users = {
    "Bob" : {"password" : "1234",
        "vouchers": {
            "adidas_1234" : {"status": "claimed", "voucher_id": "voucher_1357"}, #voucher_id here refers to the listing id rather than the id of the voucher
            "nike_2345" : {"status": "issued", "voucher_id": "voucher_2546"}
        }
        },
    "Tim" : {"password" : "asdf",
        "vouchers": {
            "uniqlo_1234" : {"status": "claimed", "voucher_id": "voucher_1468"}, #voucher_id here refers to the listing id rather than the id of the voucher
            "macs_2345" : {"status": "claimed", "voucher_id": "voucher_2580"}
    }
    },
    "Sarah" : {"password" : "1234",
        "vouchers": {
            "macs_1926" : {"status": "claimed", "voucher_id": "voucher_1357"}, #voucher_id here refers to the listing id rather than the id of the voucher
            "nike_4268" : {"status": "issued", "voucher_id": "voucher_2546"}
        }
    },
    "Claire" : {"password" : "1234",
        "vouchers": {
            "adidas_5609" : {"status": "expired", "voucher_id": "voucher_1357"}, #voucher_id here refers to the listing id rather than the id of the voucher
            "uniqlo_7098" : {"status": "issued", "voucher_id": "voucher_2546"}
        }
    }
}

merchants = {
    "Nike": {
        "password": "1234",
        "profile_image": "https://c.static-nike.com/a/images/w_1200,c_limit/bzl2wmsfh7kgdkufrrjq/seo-title.jpg",
        "vouchers": {
            "nike_4268" : {"status": "issued", "voucher_id": "voucher_2546"},
            "nike_2345" : {"status": "issued", "voucher_id": "voucher_2546"}
        },
        "listings":{
            "voucher_2546": {"claimed": 0, "issued": 2, "expired": 0, "listing_status": "active"}
        }
    },
    "Adidas":{
        "password": "1234",
        "profile_image": "https://www.changicitypoint.com.sg/images/Adidas_logo.jpg",
        "vouchers": {
            "adidas_1234" : {"status": "claimed", "voucher_id": "voucher_2546"},
            "adidas_5609" : {"status": "expired", "voucher_id": "voucher_2546"}
        },
        "listings":{
            "voucher_2546": {"claimed": 1, "issued": 0, "expired": 1, "listing_status": "inactive"}
        }
    },
    "Mcdonald's":{
        "password": "1234",
        "profile_image": "https://d1nqx6es26drid.cloudfront.net/app/uploads/2019/11/05175538/McD_TheToken%C2%AE_1235_RGB.png",
        "vouchers": {
            "macs_1926" : {"status": "issued", "voucher_id": "voucher_2546"},
            "macs_2345" : {"status": "claimed", "voucher_id": "voucher_2546"}
        },
        "listings":{
            "voucher_2546": {"claimed": 1, "issued": 1, "expired": 0, "listing_status": "active"}
        }
    },
    "Uniqlo":{
        "password": "1234",
        "profile_image": "https://micdn-13a1c.kxcdn.com/images/sg/content-images/uniqlo_123rf.jpg",
        "vouchers": {
            "uniqlo_7098" : {"status": "issued", "voucher_id": "voucher_2546"},
            "uniqlo_1234" : {"status": "claimed", "voucher_id": "voucher_2546"}
        },
        "listings":{
            "voucher_2546": {"claimed": 1, "issued": 1, "expired": 0, "listing_status": "active"}
        }
    }

}

voucher_issues = {
    "nike_4628":{
        "merchant": "Nike",
        "user": "Sarah",
        "voucher_list": "voucher_2546"
    },
    "nike_2345":{
        "merchant": "Nike",
        "user": "Bob",
        "voucher_list": "voucher_2546"
    },
    "adidas_1234":{
        "merchant": "Adidas",
        "user": "Bob",
        "voucher_list": "voucher_1357"
    },
    "adidas_5609":{
        "merchant": "Adidas",
        "user": "Bob",
        "voucher_list": "voucher_1357"
    },  
    "macs_2345":{
        "merchant": "McDonald's",
        "user": "Tim",
        "voucher_list": "voucher_2580"
    },
    "macs_1926":{
        "merchant": "McDonald's",
        "user": "Tim",
        "voucher_list": "voucher_2580"
    },
    "uniqlo_1234":{
        "merchant": "Uniqlo",
        "user": "Tim",
        "voucher_list": "voucher_1468"
    },
    "uniqlo_7098":{
        "merchant": "Uniqlo",
        "user": "Tim",
        "voucher_list": "voucher_1468"
    }
}

voucher_listings = {
    "voucher_1468":
    {
        "merchant": "Uniqlo",
        "Header": "get 25'%' storewide at Uniqlo outlets",
        "exclusions":["non PH", "2-5pm"],
        "price": "$10",
        "valid_from":"5 August 2021",
        "valid_till":"5 September 2021",
        "image1":"https://micdn-13a1c.kxcdn.com/images/sg/content-images/uniqlo_123rf.jpg",
        "image2":"https://image.uniqlo.com/UQ/ST3/sg/imagesgoods/438040/item/sggoods_09_438040.jpg?width=1600&impolicy=quality_75"
    },
    "voucher_2580":
    {
        "merchant": "Mcdonald's",
        "Header": "get $5 off every $20 spent at McDonald's",
        "exclusions":["All outlets except Jewel", "2-5pm"],
        "price": "$2",
        "valid_from":"12 July 2021",
        "valid_till":"31 September 2021",
        "image1":"https://d1nqx6es26drid.cloudfront.net/app/uploads/2019/11/05175538/McD_TheToken%C2%AE_1235_RGB.png",
        "image2":"https://metro.co.uk/wp-content/uploads/2021/07/SEC_86697653.jpg?quality=90&strip=all&zoom=1&resize=480%2C252"
    },
    "voucher_1357":
    {
        "merchant": "Adidas",
        "Header": "$20 off new shoe releases",
        "exclusions":["Not inclusive of store exclusive sneakers"],
        "price": "$10",
        "valid_from":"9 May 2021",
        "valid_till":"2 August 2021",
        "image1":"https://www.changicitypoint.com.sg/images/Adidas_logo.jpg",
        "image2":"https://assets.adidas.com/images/w_600,f_auto,q_auto/61f87dec481e4512823ea7fb0080ba1a_9366/Gazelle_Shoes_Black_BB5476_01_standard.jpg"
    },
    "voucher_2546":
    {
        "merchant": "Nike",
        "Header": "15'%'off all apparel storewide at Uniqlo outlets",
        "exclusions":["Available at all outlets except Jewel"],
        "price": "$8",
        "valid_from":"5 August 2021",
        "valid_till":"5 September 2021",
        "image1":"https://c.static-nike.com/a/images/w_1200,c_limit/bzl2wmsfh7kgdkufrrjq/seo-title.jpg",
        "image2":"https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/fnltivixlfk0fy5zkowd/sportswear-club-fleece-joggers-l0J1Fj.png"
    }
}