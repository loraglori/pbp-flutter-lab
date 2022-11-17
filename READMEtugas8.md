Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.
    Navigator.pushReplacement melakukan pergantian halaman dengan cara melakukan pop terlebih dahulu halaman yang ada saat ini dari stack, kemudian melakukan push terhadap halaman yang dituju (seperti mengganti elemen teratas pada stack dengan halaman baru).
    Navigator.push langsung melakukan push terhadap stack halaman tanpa melakukan pop sehingga halaman sebelumnya masih tetap ada dalam stack.
Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
    Form : untuk menghimpun elemen-elemen pada halaman input budget.
    TextFormField : untuk menampilkan textbox untuk menginput judul dan nominal budget.
    DropdownButtonFormField : untuk menampilkan menu dropdown berisi tipe budget.
    Drawer : sebagai bagian untuk navigasi antar halaman layaknya Navbar di Django, terdapat di bagian atas aplikasi (bisa di bawah, kiri, atau kanan juga tergantung pemosisiannya).
    Padding : Memberikan padding kepada widget child-nya.
    TextButton : untuk menambahkan tombol submisi budget
    Card : untuk menampilkan informasi mengenai suatu budget dalam bentuk kotak kartu.
    InputDecoration : untuk mengkustomisasi tampilan dari TextFormField, seperti menambahkan teks bantuan, label, ikon, serta border.
Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).
1.  `onTapDown`
2.  `onTapUp`
3.  `onTapCancel` 
4.  `onScaleStart `
5.  `onScaleUpdate `
6.  `onScaleEnd`
7.  `onPressed `
8.  `onTap`
9.  `onChanged `
10. `onSubmitted `
11. `onLongPress `
12. `onDoubleTap `
13. `onVerticalDragStart`
14. `onVerticalDragUpdate` 
15. `onVerticalDragEnd`
Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.
    Pada dasarnya, perlu diketahui bahwa Navigator bekerja sebagai manager untuk setiap child yang ada layaknya Stack. Tujuan dari hal ini adalah nantinya Navigator akan menjadi urutan logika dalam menampilkan halaman pada aplikasi. Yang disimpan pada Navigator adalah rute-rute pada app. Untuk berpindah dari satu halaman ke halaman lain, terdapat method push dan pop. push adalah untuk menambahkan rute baru pada Navigator serta pindah ke rute tersebut sedangkan pop adalah untuk melepas rute yang ada di paling atas Navigator dan kembali ke rute sebelumnya.
Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.