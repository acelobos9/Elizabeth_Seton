@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-9 col-md-offset-1">
        		<div class="js-wizard-simple block">
<ul class="nav nav-tabs nav-justified">
<li class="active">
<a href="#simple-classic-progress-step1" data-toggle="tab" aria-expanded="true">1. Admission Information</a>
</li>
<li class="">
<a href="#simple-classic-progress-step2" data-toggle="tab" aria-expanded="false">2. Personal Data</a>
</li>
<li class="">
<a href="#simple-classic-progress-step3" data-toggle="tab" aria-expanded="false">3. Requirements</a>
</li>
</ul>
	<form class="form-horizontal" action="{{ url('/admission') }}" method="post">
		{{ csrf_field() }}
		<div class="block-content block-content-mini block-content-full border-b">
			<div class="wizard-progress progress progress-mini remove-margin-b">
				<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 33.3333%;"></div>
			</div>
		</div>
		<div class="block-content tab-content">
			<div class="tab-pane fade fade-up push-30-t push-50 active in" id="simple-classic-progress-step1">
				<!--First Panel Contents-->
					<div class="form-group">
					<div class="col-md-6">
						<div class="form-material form-material-success fqwert">
							<select class="form-control" id="material-select2" name="lib_campus_id" size="1">
								<option hidden value="" selected disabled></option>
								<option value="1">Elizabeth Seton School Las Pi&ntilde;as </option>
								<option value="2">Elizabeth Seton School Cavite </option>
							</select>
							<label for="contact3-firstname"><i class="fa fa-university"></i> Choose Campus Site</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-material form-material-success fqwert">
							<select class="form-control" id="material-select2" name="schedule_pref" size="1">
								<option hidden value="" selected disabled></option>
								<option value="1">AM Session</option>
								<option value="1">NN Session</option>
								<option value="2">PM Session</option>
							</select>
							<label for="contact3-firstname"><i class="fa fa-clock-o"></i> Preferred Schedule</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-8">
						<div class="form-material form-material-success fqwert">
							<select class="form-control" id="material-select2" name="lib_course_id" size="1">
								<option hidden value="" selected disabled></option>
								<option value="8">
									Science,Technology,Engineering and Mathematics
								</option>
								<option value="9">
									Humanities and Social Sciences
								</option>
								<option value="7">
									Accountancy,Business and Management
								</option>
								<option value="2">
									Pre-Elementary
								</option>
								<option value="3">
									Grade School Department
								</option>
								<option value="5">
									Junior High School
								</option>
							</select>
							<label for="contact3-firstname"><i class="fa fa-graduation-cap"></i> Course</label>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-material form-material-success fqwert">
							<select class="form-control"  id="material-select2" name="lib_academic_levels"  size="1">
								<option selected value="">
								</option>
								<option value="1">
										Kinder
								</option>
								<option value="2">
										Toddler
								</option>
								<option value="3">
									Nursery
								</option>
								<option value="4">
									Grade 1
								</option>
								<option value="5">
									Grade 2
								</option>
								<option value="6">
									Grade 3
								</option>
								<option value="7">
									Grade 4
								</option>
								<option value="8">
									Grade 5
								</option>
								<option value="9">
									Grade 6
								</option>
								<option value="10">
									Grade 7
								</option>
								<option value="11">
									Grade 8
								</option>
								<option value="12">
									Grade 9
								</option>
								<option value="13">
									Grade 10
								</option>
								<option value="14">
									Grade 11
								</option>

								<option value="15">
									Grade 11
								</option>
							</select>
							<label for="contact3-firstname"><i class="fa fa-book"></i> Grade Level</label>
						</div>
					</div>

				</div>
				<div class="form-group">
					<div class="col-md-6">
						<div class="form-material form-material-success fqwert">
							<select class="form-control" id="material-select2" name="lib_nationality_id" size="1">
								<option hidden value="" selected disabled></option>
								<option value="1">Filipino</option>
								<option value="2">Japanese</option>
							</select>
							<label for="contact3-firstname"><i class="fa fa-flag"></i> Nationality</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-material form-material-success fqwert open">
							<select class="form-control" id="material-select2" name="lib_religion_id" size="1">
								<option hidden value="" selected disabled></option>
								<option value="1">Roman Catholic</option>
								<option value="1">Iglesia</option>
								<option value="2">Islam</option>
							</select>
							<label for="contact3-firstname">⛪ Religion</label>
						</div>
					</div>
				</div>
				<!--End of First Panel-->
			</div>
			<div class="tab-pane fade fade-up push-30-t push-50" id="simple-classic-progress-step2">
				<!--Second Panel Contents-->
					<br>
				<div class="form-group">
					<h4 class="push">&nbsp;&nbsp;&nbsp;Student's Information</h4>
					<div class="col-md-4">
						<div class="form-material form-material-success fqwert">
							<input class="form-control" type="text" id="material-color-success2" name="lastname">
							<label for="material-color-success2">Surname</label>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-material form-material-success fqwert">
							<input class="form-control" type="text" id="material-color-success2" name="firstname">
							<label for="material-color-success2">First Name</label>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-material form-material-success fqwert">
							<input class="form-control" type="text" id="material-color-success2" name="middlename">
							<label for="material-color-success2">Middle Name</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-4">
							<label for="material-color-success2">Sex</label>
							<br>
						<label class="css-input css-radio css-radio-success push-10-r">
						<input type="radio" name="gender" value="Male" checked=""><span></span> Male
						</label>
						<label class="css-input css-radio css-radio-success">
						<input type="radio" name="gender" value="Female"><span></span> Female
						</label>

					</div>
					<div class="col-md-4">
						<div class="form-material form-material-success fqwert">
						<input class="js-datepicker form-control" type="text" id="example-datepicker4" name="birthdate" data-date-format="mm/dd/yy" placeholder="">
						<label for="example-datepicker4">Date of Birth</label>
						</div>
					</div>
					<div class="col-md-4"></div>
				</div>

					<br>
				<div class="form-group">
					<h4 class="push">&nbsp;&nbsp;&nbsp;Father's Data</h4>
					<div class="col-md-4">
						<div class="form-material form-material-success fqwert">
							<input class="form-control" type="text" id="material-color-success2" name="p_lastname[]">
							<label for="material-color-success2">Surname</label>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-material form-material-success fqwert">
							<input class="form-control" type="text" id="material-color-success2" name="p_firstname[]">
							<label for="material-color-success2">First Name</label>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-material form-material-success fqwert">
							<input class="form-control" type="text" id="material-color-success2" name="p_middlename[]">
							<label for="material-color-success2">Middle Name</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-6">
						<div class="form-material form-material-success fqwert">
							<input class="form-control" type="text" id="material-color-success2" name="p_occupation[]">
							<label for="material-color-success2">Occupation</label>
						</div>
					</div>
				</div>
					<br>
				<div class="form-group">
					<h4 class="push">&nbsp;&nbsp;&nbsp;Mother's Data</h4>
					<div class="col-md-4">
						<div class="form-material form-material-success fqwert">
							<input class="form-control" type="text" id="material-color-success2" name="p_lastname[]">
							<label for="material-color-success2">Maiden Last Name</label>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-material form-material-success fqwert">
							<input class="form-control" type="text" id="material-color-success2" name="p_firstname[]">
							<label for="material-color-success2">First Name</label>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-material form-material-success fqwert">
							<input class="form-control" type="text" id="material-color-success2" name="p_middlename[]">
							<label for="material-color-success2">Middle Name</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-6">
						<div class="form-material form-material-success fqwert">
							<input class="form-control" type="text" id="material-color-success2" name="p_occupation[]">
							<label for="material-color-success2">Occupation</label>
						</div>
					</div>
				</div>
				<br>
				<div class="form-group">
					<h5 class="push text-success">&nbsp;&nbsp;&nbsp;In Case of Emergency</h5>
					<div class="col-md-4">
						<div class="form-material form-material-success fqwert input-group">
							<span class="input-group-addon"><i class="fa fa-address-book-o"></i></span>
							<input class="form-control" type="text" id="material-color-success2" name="contact_person">
							<label for="material-color-success2">&nbsp;Contact Person</label>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-material form-material-success fqwert input-group">
						<span class="input-group-addon"><i class="fa fa-envelope-o"></i></span>
							<input class="form-control" type="email" id="material-color-success2" name="contact_email">
							<label for="material-color-success2">&nbsp;Email Address</label>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-material form-material-success fqwert input-group">
							<span class="input-group-addon"><i class="fa fa-user-circle-o"></i></span>
							<input class="form-control" type="text" id="material-color-success2" name="contact_relationship">
							<label for="material-color-success2">&nbsp;Relationship</label>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-material form-material-success fqwert input-group">
						<span class="input-group-addon"><i class="fa fa-building-o"></i></span>
							<input class="form-control" type="text" id="material-color-success2" name="contact_address1">
							<label for="material-color-success2">&nbsp;House No. / Unit Address / Barangay</label>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-material form-material-success fqwert input-group">
						<span class="input-group-addon"><i class="fa fa-bank"></i></span>
							<input class="form-control" type="text" id="material-color-success2" name="contact_address2">
							<label for="material-color-success2">&nbsp;Municipality | City</label>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-material form-material-success fqwert input-group">
						<span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
							<input class="form-control" type="text" id="material-color-success2" name="contact_address3">
							<label for="material-color-success2">&nbsp;State | Province</label>
						</div>
					</div>
				</div>
			</div>
			<div class="tab-pane fade fade-up push-30-t push-50" id="simple-classic-progress-step3">
				<h4>Contact Information</h4>
				<p class="text-muted">NOTE: You will be contacted with the details provided below, please make sure you have given the correct details.</p>
				<br>
				<div class="form-group">
					<div class="col-md-4"> 
						<div class="form-material form-material-success fqwert">
							<input class="form-control" required type="tel" id="material-color-success2" name="adm_mobile_no">
							<label for="material-color-success2">Mobile No.</label>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-material form-material-success fqwert">
							<input class="form-control" required type="email" id="material-color-success2" name="adm_email">
							<label for="material-color-success2">Email</label>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-material form-material-success fqwert">
							<input class="form-control" type="tel" id="material-color-success2" name="adm_landline">
							<label for="material-color-success2">Landline No.</label>
						</div>
					</div>
				</div>
				<div class="alert alert-info alert-dismissable">
				
				<p>Attach the required photo and documents</p>
				</div>
				
				<div class="form-group">
					<div class="col-md-4"> 
						<h4><i class="fa fa-user-circle"></i> ID Picture 2x2</h4>
						<br>
						<div class="input-group input-file" name="Fichier1">
				    		<input type="text" class="form-control" name="req_id_photo" placeholder='Choose a file...' />			
				            <span class="input-group-btn">
				        		<button class="btn btn-default btn-choose" type="button">Select File</button>
				    		</span>
						</div>
					</div>
					<div class="col-md-4">
						<h4><i class="fa fa-file-text-o"></i> Birth Certificate</h4>
						<br>
						<div class="input-group input-file" name="Fichier1">
				    		<input type="text" class="form-control" req="req_birth_certificate" placeholder='Choose a file...' />			
				            <span class="input-group-btn">
				        		<button class="btn btn-default btn-choose" type="button">Select File</button>
				    		</span>
						</div>
					</div>
					<div class="col-md-4">
						<h4><i class="fa fa-certificate"></i> Baptismal Certificate</h4>
						<br>
						<div class="input-group input-file" name="Fichier1">
				    		<input type="text" class="form-control" name="req_baptismal_certificate" placeholder='Choose a file...' />			
				            <span class="input-group-btn">
				        		<button class="btn btn-default btn-choose" type="button">Select File</button>
				    		</span>
						</div>
					</div>
				</div>
				
				<br>
				<p class="text-success"><b>Kindly bring the following requirements:</b></p>
				
				<ul>
				  <li>3 pcs. (1X1) colored ID pictures (white background)</li>
	              <li>PSA/NSO Birth Certificate (Original and Photocopy)</li>
	              <li>Baptismal Certificate (Original and Photocopy)</li>
	              <li>Certified True Copy of Latest Report Card with LRN (with 1st and 2nd quarter grade entries)</li>
	              <li>Letter of Recommendation / Good Moral Certification from the school attended</li>
	              <li>Early Childhood Education Report Card/Certification (Grade 1-6 only)</li>
	              <li>Complete Scholastic Record (if from school abroad)</li>
				</ul>
				<p><b>Additional requirements for SHS Applicants</b></p>
				<ul class="">
                              <li>NCAE Result (Original and Photocopy)</li>
                              <li>Grade 10 Certificate of Completion (Original and Photocopy)</li>
                              <li>Qualified Voucher Recipient (QVR) Certificate (for Voucher Holder only)</li>
                            </ul>
			</div>
		</div>
		
		<div class="block-content block-content-mini block-content-full border-t">
		<div class="row">
		<div class="col-xs-6">
		<button class="wizard-prev btn btn-default disabled" type="button"><i class="fa fa-arrow-left"></i> Previous</button>
		</div>
		<div class="col-xs-6 text-right">
		<button class="wizard-next btn btn-default" type="button" style="display: inline-block;">Next <i class="fa fa-arrow-right"></i></button>
		<button class="wizard-finish js-swal-success btn btn-default" type="sumbit"><i class="fa fa-check text-success push-5-r"></i> Submit</button>
		
		</div>
		</div>
		</div>
	</form>
</div>
        </div>	
    </div>
</div>
<script type="text/javascript">function bs_input_file() {
	$(".input-file").before(
		function() {
			if ( ! $(this).prev().hasClass('input-ghost') ) {
				var element = $("<input type='file' class='input-ghost' style='visibility:hidden; height:0'>");
				element.attr("name",$(this).attr("name"));
				element.change(function(){
					element.next(element).find('input').val((element.val()).split('\\').pop());
				});
				$(this).find("button.btn-choose").click(function(){
					element.click();
				});
				$(this).find("button.btn-reset").click(function(){
					element.val(null);
					$(this).parents(".input-file").find('input').val('');
				});
				$(this).find('input').css("cursor","pointer");
				$(this).find('input').mousedown(function() {
					$(this).parents('.input-file').prev().click();
					return false;
				});
				return element;
			}
		}
	);
}
$(function() {
	bs_input_file();
});</script>
@endsection

