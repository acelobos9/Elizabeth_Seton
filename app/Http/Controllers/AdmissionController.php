<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Admission;
use App\Children;
use App\AdmissionStatus;
use App\PersonalInformation;
use App\PIContacts;
use App\Emergency;
use App\AdmissionContact;

class AdmissionController extends Controller
{
    public function index()
    {
        return view('admission');
    }

    public function postadd(Request $request){
        // generate unique reference code
       // $reference_code = strtoupper(generate_refCode());

        $admission = new Admission;
        $children = new Children;
        //admission entry data to database
        $admission->lib_campus_id = $request->lib_campus_id;
        $admission->schedule_pref = $request->schedule_pref;
        $admission->lib_course_id = $request->lib_course_id;
        $admission->lib_academic_levels = $request->lib_academic_levels;
        $admission->lib_sis_admission_entry_status_id = 0;
        $admission->reference_code = strtoupper($this->generate_refCode(6));
        $admission->save();
        //$admission_id = $admission->$id;

        //saves personal information provided
        $personal_info = new PersonalInformation;
        $personal_info->lastname = $request->lastname;
        $personal_info->firstname = $request->firstname;
        $personal_info->middlename = $request->middlename;
        $personal_info->gender = $request->gender;
        $formatted_bdate = str_replace('/', '-', strtotime($request->birthdate));
        $personal_info->birthdate = date("Y:m:d",$formatted_bdate);
        $personal_info->lib_nationality_id = $request->lib_nationality_id;
        $personal_info->lib_religion_id = $request->lib_religion_id;
        
       
        
        $firstname = $personal_info->firstname;
        $lastname = $personal_info->lastname;
        //Saves parent information of the student
        //Saves Information of the Father
        $parent_personal_info = new PersonalInformation;
        $parent_personal_info->lastname =  $request->f_lastname;
        $parent_personal_info->firstname =  $request->f_firstname;
        $parent_personal_info->middlename =  $request->f_middlename;
        //$parent_personal_info->occupation =  $request->p_occupation;//unsupported
        $parent_personal_info->save();
        $father_id = $parent_personal_info->id;//gets the ID of the father
        //Saves Information of the Mother
        $parent_personal_info->lastname =  $request->m_lastname;
        $parent_personal_info->firstname =  $request->m_firstname;
        $parent_personal_info->middlename =  $request->m_middlename;
        //$parent_personal_info->occupation =  $request->p_occupation;//unsupported
        $parent_personal_info->save();
        $mother_id = $parent_personal_info->id;//gets the ID of the mother


        //Saves emergency contact data
        $emergency = new Emergency;
        $emergency->contact_name = $request->contact_person;
        $emergency->contact_email = $request->contact_email;
        $emergency->contact_relationship = $request->contact_relationship;
        $emergency->contact_address = $request->contact_address1;
        $emergency->contact_municipality = $request->contact_address2;
        $emergency->contact_province = $request->contact_address3;
        $emergency->save();
        $personal_info->emergency_id = $emergency->id;
        $personal_info->save();
         $student_id = $personal_info->id;
         $admission->pi_id = $student_id;
        $admission->save();
        //admision contact data
        $contact = new AdmissionContact;
        $contact->pi_id = $student_id;
        $contact->mobile_no = $request->adm_mobile_no;
        $contact->email = $request->adm_email;
        $contact->landline = $request->adm_landline;
        $contact->save();
        //send email to student regarding his application
        $recipient = "acelobos9@gmail.com";
        $subject = "Elizabeth Seton School Admission";
        $message = "<h1 style='font-family:Helvetica, Roboto, San-Serif;font-weight:300;margin-bottom:0px;'>Thank you for choosing our school</h1><br><h4>Greetings ".$firstname." ".$lastname."!</h4><p>We received your application and will process it the soonest possible. For the meanwhile, you can track the status of your admission at: ##Link To Tracker## and enter your reference code: </p><span style='padding:25px;font-family:Helvetica, Roboto, San-Serif; background:#d0f7c0;color:#054f21;font-weight:600;letter-spacing:1px;'>".$admission->reference_code."</span><hr><p>This is an auto-generated email. Please do not reply. You can reach us with the contact details below:</p>";
        //sends a notification via email
        
        //admission requirements | attachments
        $admission->req_id_photo = $request->req_id_photo;
        $admission->req_birth_certificate = $request->req_birth_certificate;
        $admission->req_baptismal_certificate = $request->req_baptismal_certificate;

        //redirect('/admission');
                //Saves parent IDs and student ID
        $children->pi_id = $student_id;
        $children->pi_parent_id = $father_id;
        $children->save(); //save father info
        $children->pi_parent_id = $mother_id;
        $children->save(); //save mother info
         $headers = 'From: <teamsupremoph@gmail.com>';
         $this->sendMessage($admission->reference_code,$firstname,"9168345949");
       
        
    }

    function generate_refCode($length) {
    $random = '';
    for ($i = 0; $i < $length; $i++) {
        $random .= chr(rand(ord('a'), ord('z')));
    }
    return $random;
    }

    function notifyEmail($message,$recipient,$subject){
       
        if(mail($recipient,$subject,$message,$headers)){
            return true;
        }else{
            return false;
        }
    }

    function sendMessage($refCode,$name,$recipient){
    $arr_post_body = array(
        "message_type" => "SEND",
        "mobile_number" => "63".$recipient,
        "shortcode" => "29290888000",
        "message_id" => uniqid(),
        "message" => urlencode("Hi ".$name."!hank you for choosing Elizabeth Seton School. Your reference code is: ".$refCode." "),
        "client_id" => "2177e44257fcf8eb3e9435398485dddb34b3864181655755141a92f52994829c",
        "secret_key" => "58443d551c788bbada11d6434c74710b4485c21f6eee5df68d04f7d11c604ede
"
    );

    $query_string = "";
    foreach($arr_post_body as $key => $frow)
    {
        $query_string .= '&'.$key.'='.$frow;
    }

    $URL = "https://post.chikka.com/smsapi/request";

    $curl_handler = curl_init();
    curl_setopt($curl_handler, CURLOPT_URL, $URL);
    curl_setopt($curl_handler, CURLOPT_POST, count($arr_post_body));
    curl_setopt($curl_handler, CURLOPT_POSTFIELDS, $query_string);
    curl_setopt($curl_handler, CURLOPT_RETURNTRANSFER, TRUE);
    $response = curl_exec($curl_handler);
    curl_close($curl_handler);

    exit(0);


    }

}

