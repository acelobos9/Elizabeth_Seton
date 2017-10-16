<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Admission;
use App\AdmissionStatus;
use App\PersonalInformation;
use App\PIContacts;


class AdmissionController extends Controller
{
    public function index()
    {
        return view('admission');
    }

    public function postadd(Request $request){
        //new admission model instance
        $admission = new Admission;
        //admission entry data
        $admission->lib_campus_id = $request->lib_campus_id;
        $admission->schedule_pref = $request->schedule_pref;
        $admission->lib_course_id = $request->lib_course_id;
        $admission->lib_academic_levels = $request->lib_academic_levels;
        $admission->lib_sis_admission_entry_status_id = 0;
        
        //save admission data into database
        $admission->save();

        $personal_info = new PersonalInformation;
        $personal_info->lastname = $request->lastname;
        $personal_info->firstname = $request->firstname;
        $personal_info->middlename = $request->middlename;
        $personal_info->gender = $request->gender;
        $formatted_bdate = str_replace('/', '-', strtotime($request->birthdate));
        $personal_info->birthdate = date("Y:m:d",$formatted_bdate);
        $personal_info->lib_nationality_id = $request->lib_nationality_id;
        $personal_info->lib_religion_id = $request->lib_religion_id;
         //save admission data into database
        $personal_info->save();

        $parent_personal_info = new PersonalInformation;
        //admission parent information
       // $pi_array = array();

        foreach ($request->p_lastname as $index => $value) {
            $parent_personal_info->lastname =  $request->p_lastname[$index];
            $parent_personal_info->firstname =  $request->p_firstname[$index];
            $parent_personal_info->middlename =  $request->p_middlename[$index];
            //$parent_personal_info->occupation =  $request->p_occupation[$index];
            $parent_personal_info->save();
        }
        
        //@todo
        //emergency contact data
        $admission->contact_person = $request->contact_person;
        $admission->contact_email = $request->contact_email;
        $admission->contact_relationship = $request->contact_relationship;
        $admission->contact_address1 = $request->contact_address1;
        $admission->contact_address2 = $request->contact_address2;
        $admission->contact_address3 = $request->contact_address3;

        //admision contact data
        $admission->adm_mobile_no = $request->adm_mobile_no;
        $admission->adm_email = $request->adm_email;
        $admission->adm_landline = $request->adm_landline;

        //admission requirements | attachments
        $admission->req_id_photo = $request->req_id_photo;
        $admission->req_birth_certificate = $request->req_birth_certificate;
        $admission->req_baptismal_certificate = $request->req_baptismal_certificate;

        //redirect('/admission');

    }

}

