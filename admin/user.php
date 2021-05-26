<?php
include "template/header.php";
include 'dataSource\queryTable.php';
include 'system/function.php';
$user = getAllData('user');

?>

<div class="container">
    <div class="header">
        <button class="btn primary" onclick="window.location = 'produk.php'"><i class="fas fa-arrow-left"></i> kembali</button>
    </div>
    <?php if (!empty($_SESSION['alert'])) : ?>
        <div class="alert <?= $_SESSION['alert']['alert'] ?>">
            <?= $_SESSION['alert']['value'] ?>
        </div>
    <?php endif;
    unset($_SESSION['alert']);

    ?>
    <div class="table-Admin">
        <div class="nav-table">
            <h3>Admin User</h3>
            <div class="btn primary" id="cat"><i class="fas fa-edit"></i> Tambah User</div>
        </div>
        <table class="kategori-table">
            <tr>
                <td>No</td>
                <td>Nama</td>
                <td>Username</td>
                <td>Email</td>
                <td>Aksi</td>
            </tr>
            <?php
            $no = 1;
            foreach ($user as $user) : ?>
                <tr>
                    <td><?= $no ?></td>
                    <td><?= $user[1] ?></td>
                    <td><?= $user[2] ?></td>
                    <td><?= $user[3] ?></td>
                    <td>
                        <button onclick='edit(<?= $user[0] ?>)' class='btn warning'><i class='fas fa-edit'></i> Edit</button>
                        <button class="btn danger" onclick="hapus(<?= $user[0] ?>)"><i class="fas fa-trash"></i> Hapus</button>
                    </td>
                </tr>
            <?php $no++;
            endforeach; ?>

        </table>
    </div>
</div>
<!-- modal boxes -->
<div id="myModal" class="modal">
    <!-- Modal content -->
    <div class="modal-content">
        <div class="modal-header">
            <h3>Tambah User</h3>
            <span class="close">&times;</span>
        </div>
        <div class="modal-body">
            <form action="system/dashboard.php?system=user&query=add" class="controll" method="POST">
                <div class="input-control">
                    <label for="">Nama</label>
                    <input type="text" name="nama" placeholder="nama lengkap">
                </div>
                <div class="input-control">
                    <label for="">Username</label>
                    <input type="text" id='username' name="username" placeholder="username">
                    <div id="alert"></div>
                </div>
                <div class="input-control">
                    <label for="">Password</label>
                    <input type="password" name="password" placeholder="password">
                </div>
                <div class="input-control">
                    <label for="">email</label>
                    <input type="email" name="email" placeholder="email">
                </div>
                <button class="btn primary submit block" type="submit">tambah</button>
            </form>
        </div>
    </div>
</div>
<div id="edit-modal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h3>Edit User</h3>
            <span class="close">&times;</span>
        </div>
        <div class="modal-body">
            <form action="system/dashboard.php?system=user&query=update" class="controll" method="POST">
            <div class="input-control">
                    <label for="">Nama</label>
                    <input type="hidden" name="id" id="id_user">
                    <input type="text" name="nama" id='nama' placeholder="nama lengkap">
                </div>
                <div class="input-control">
                    <label for="">Username</label>
                    <input type="text" id='username_edit' name="username" placeholder="username">
                    <div id="alert"></div>
                </div>
                <div class="input-control">
                    <label for="">Password</label>
                    <input type="password" name="password" id='password' placeholder="password">
                </div>
                <div class="input-control">
                    <label for="">email</label>
                    <input type="email" name="email" id='email' placeholder="email">
                </div>
                <button class="btn primary submit block" type="submit">user</button>
        </div>
    </div>
</div>
</div>
<script src="<?= $baseUrl ?>/admin/vendor/js/user.js"></script>

<?php include "template/footer.php";
