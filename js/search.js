// cara ajax polos

// var keyword = document.getElementById('keyword');
// var searchButton = document.getElementById('button-cari');
// var containerSearch = document.getElementById('active-search');

// keyword.addEventListener('keyup', function() {
//     var xhr = new XMLHttpRequest();
//     xhr.onreadystatechange = function () {
//         if(xhr.readyState == 4 && xhr.status == 200) {
//             containerSearch.innerHTML = xhr.responseText;
//         }
//     }

//     xhr.open('GET', 'ajax/search.php?keyword=' + keyword.value, true);
//     xhr.send();
// });


// jquery

$(document).ready(function(){

    let jenis = '';
    let kondisi = '';
    var provinsi = '';
    var regency = '';
    let sort = 'id_sumber_air';
    let order = 'ASC';
    let keyword = '';

    $('#filter-sort').on('change reset', function () {
        sort = this.value;
        
    });

    $('#filter-order').on('change reset', function () {
        order = this.value;
    });

    $('#filter-provinsi').on('change reset', function () {
        provinsi = this.value;
        var url = 'get_kabupaten.php?id_prov=' + provinsi;

        $("#kabupaten").html('');
        $.ajax({
            url: url,
            type: 'GET',
            dataType: 'json',
            success: function (result) {
                $("#regency-title").remove();
                $("#filter-regency").append('<option value="" selected disabled>Pilih</option>');
                $("#filter-regency").append('<option value="" >All</option>');
                for (var i = 0; i < result.length; i++) {
                    // apa yang akan dilakukan pada data json yang sudah digenerate
                    $("#filter-regency").append('<option value="' + result[i].id_kab + '">' + result[i].nama + '</option>');
                }
            }
        });

    });

    $('#filter-regency').on('change reset', function () {
        regency = this.value;

    });

    $('#filter-jenis').on('change reset', function () {
        jenis = this.value;
        
    });

    $('#filter-kondisi').on('change reset', function () {
        kondisi = this.value;

    });

    
    // console.log('ok lah');
    $('#keyword').on('keyup', function() {
        // jquery compact
        // $('#active-search').load('ajax/search.php?keyword=' + $('#keyword').val());
        // console.log(jenis);
        keyword = this.value;
        

        // jquery flexible
        $.get('ajax/search.php?keyword=' + keyword + '&sort=' + sort + '&order=' + order + '&provinsi=' + provinsi + '&regency=' + regency + '&jenis=' + jenis + '&kondisi=' + kondisi, function (data) {
            $('#active-search').html(data);
        });
    });

    $('#filter-reset').on('click', function () {
        jenis = '';
        kondisi = '';
        provinsi = '';
        regency = '';
        sort = 'id_sumber_air';
        order = 'ASC';
        // $.get('ajax/regency.php?&provinsi=' + provinsi, function (data) {
        //     $('#regency').html(data);
        // });
        

    });

    $('#filter-apply').on('click', function () {
        
        $.get('ajax/search.php?keyword=' + keyword + '&sort=' + sort + '&order=' + order + '&provinsi=' + provinsi + '&regency=' + regency + '&jenis=' + jenis + '&kondisi=' + kondisi, function (data) {
            $('#active-search').html(data);
        });

    });
});





