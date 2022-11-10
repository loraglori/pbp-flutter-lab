Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
  stateless widget adalah widget yang tidak dapat dan tidak akan pernah berubah. Contohnya widget berisi halaman tentang informasi mengenai aplikasi, seperti nama, logo, versi, dll yang bersifat statis.
  stateful widget adalah kebalikan dari stateless widget, yaitu widget yang bisa berubah atau bersifat dinamis. staetful widget berisi halaman yang bisa berubah tampilannya, seperti berubah warna, tulisan, dll. setState() merupakan fungsi untuk memberitahu framework bahwa ada yang berubah pada tampilan.

Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
  Text: visible widget, untuk menampilkan text ->text ganjil atau genap
  Button: visible widget, untuk menampilkan button dan fungsi dari button saat di-klik ->button increment dan decrement
  Icon: visible widget, untuk menampilkan kontainer berisi icon ->+ dan -
  Padding: invisible widget, untuk me-wrap widget-widget dan padding
  C0llumn
  Scaffold: invisible widget, untuk membuat framework
  Stack: invisible widget, untuk mengatur overlapping widget seperti button pada background
  statefulwidget dan statelesswidget : state management widget, untuk mengatur state dari widget

Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
  fungsi setState() memberitahu framework bahwa ada ada perubahan pada objek pada tampilan supaya framwork melakukan update pada objek tersebut

Jelaskan perbedaan antara const dengan final.
  const mengkonstruksi objek dan digunakan saat value objek diketahui saat di compile time
  final mengassign value dan tidak dapat diubah dan digunakan saat value objek tidak dikethui saat di compile time, dan akan diketahui/dikalkulasi saat di runtime

Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
  1. membuat program flutter baru counter_7 dengan flutter create counter_7 di direktori
  2. mengassign value _counter dan menambahkan fungsi isEvenOrOdd untuk mengassign string even atau odd dengan memeriksa sisa module _counter
  3. membuat fungsi _incrementCounter yang menambah nilai _counter dan memenggil fungsi isEvenOrOld
  4. membuat fungsi _decrementCounter yang mengurangi nilai _counter dan memenggil fungsi isEvenOrOld
  5. menambah tampilan context widget
  6. menambah fungsi button
