$(document).on('turbolinks:load', function() {
    $(".coupe").hide();
    $(".comfort").hide();
    $(".sitting").hide();
    $(".platzkart").hide();
    $('select').on('change', function() {
        var selected = this.value;
        console.log(selected);
        switch (selected) {
            case "Coupe":
                $(".coupe").show();
                $(".comfort").hide();
                $(".sitting").hide();
                $(".platzkart").hide();
                break;
            case "Comfort":
                $(".coupe").hide();
                $(".comfort").show();
                $(".sitting").hide();
                $(".platzkart").hide();
                break;
            case "Sitting":
                $(".coupe").hide();
                $(".comfort").hide();
                $(".sitting").show();
                $(".platzkart").hide();
                break;
            case "Platzkart":
                $(".coupe").hide();
                $(".comfort").hide();
                $(".sitting").hide();
                $(".platzkart").show();
                break;
            default:
                alert( 'Я таких значений не знаю' );
        }
    })
});