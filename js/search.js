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
    let keyword = '';
    $('#filter-jenis').on('change', function () {
        jenis = this.value;

        $.get('ajax/search.php?keyword=' + keyword + '&jenis=' + jenis, function (data) {
            $('#active-search').html(data);
        });
        
    })
    
    // console.log('ok lah');
    $('#keyword').on('keyup', function() {
        // jquery compact
        // $('#active-search').load('ajax/search.php?keyword=' + $('#keyword').val());
        console.log(jenis);
        keyword = this.value;
        

        // jquery flexible
        $.get('ajax/search.php?keyword=' + keyword + '&jenis=' + jenis, function(data) {
            $('#active-search').html(data);
        });
    });
});





