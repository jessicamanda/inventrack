
<head>
	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
	<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
</head>
<!-- Begin Page Content -->

	<div class="row">

		<div class="col-lg-12">
			<!-- Circle Buttons -->
			<div class="card shadow mb-12">
				<div class="card-body">
					<form method="post" action="<?=base_url()?>Jenis_barang/simpan" autocomplete="off">
						<div class="form-group col-lg-12">
							<label>Jenis Barang</label>
							<input type="text" name="jenisbarang" class="form-control" required>
						</div>
						<div class="form-group col-lg-6">
                            <a href="<?= base_url()?>Jenis_barang" class="btn btn-warning">Cancel</a>
							<button type="reset" class="btn btn-info">Reset</button>
                            <button type="submit" class="btn btn-success btn-flat">Simpan</button>
						</div>
				</div>
			</div>
		</div>
	</div>

</div>

</div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
<script>
	$('.js-single').select2({
		placeholder: 'Select an option'
	});

</script>
