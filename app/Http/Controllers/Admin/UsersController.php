<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\UserRequest;
use App\Models\Users;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UsersController extends Controller
{
    public function __construct(Users $users){
        $this->users = $users;
    }
    public function index(){
        $items = $this->users->getItem();
        return view('admin.user.index',compact('items'));
    }

    public function add(){
		$url = url()->current();
		return view('admin.user.add',compact('url'));
	}
	public function postAdd(UserRequest $request){
		$username = $request->username;
		$password = bcrypt($request->password);
		$fullname = $request->fullname;
		$data = ['username' => $username,'password' => $password,'fullname' => $fullname, 'active' => 0, 'wrong' => 0, 'token_created' => '','updated_at'=> ''];
		$result = $this->users->addItem($data);
		if($result){
			return redirect()->route('admin.user.index');
		}
		else{
			return redirect()->route('admin.user.index')->with("msg","Lỗi. Vui lòng thử lại.");
		}
	}
	public function edit($id, Request $request){
		$url = url()->current();
		$user = $this->users->getItemFirst($id);
		if(Auth::user()->username != $user->username && Auth::user()->username != 'admin'){
			$request->session()->flash('msg','Bạn không thế sửa thông tin của người khác');
			return redirect()->route('admin.user.index');
		}
		return view('admin.user.edit',compact('id','user','url'));
	}
	public function postEdit(Request $request, $id){
		$username = $request->username;
		$password = bcrypt($request->password);
		$fullname = $request->fullname;
		$data = ['username' => $username,'password'=>$password ,'fullname' => $fullname];
		$result = $this->users->editItem($data, $id);
		if($result){
			return redirect()->route('admin.user.index')->with("msg","Đã sửa thành công");
		}
		else{
			return redirect()->route('admin.user.index')->with("msg","Lỗi. Vui lòng thử lại.");
		}
	}
	public function del($id, Request $request){
		$result = $this->users->delItem($id);
		return redirect()->route('admin.user.index')->with("msg","Đã xóa thành công");
	}
	
	public function search(Request $request){
		$url = url()->current();
		$search = $request->search;
		$items = $this->users->searchItem($search);
		return view('admin.user.search',compact('items','url'));
	}
}
