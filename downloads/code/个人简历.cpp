/*
 * =====================================================================================
 *
 *       Filename:  个人简历.cpp
 *
 *    Description:  个人简历
 *
 *        Version:  1.0
 *        Created:  2013-6-08 18:54:05
 *       Revision:  none 
 *            BUG:  no init for class myself(because .....)
 *       Compiler:  gcc
 *
 *         Author:  ACman mdk (Orz Linux Sir Koma linyu zhujiajun), mdk@server.example.com
 *        Company:  ACM 309 JudgeOnline
 *
 * =====================================================================================
 */
#include<iostream>
#include<string>
#include<cstdio>
#include<cstdlib>
#include<vector>
#include<list>
#include<map>
#include<stack>
#include<algorithm>
using namespace std;

class myself{
	
	public:
	string name;
	string email1;
	string email2;
	string phone;
	vector<string> skills;
	map<string, string> other_table;
	
	public:
	void education()
	{
		printf("%s在校本科生\n","中国计量学院");
		printf("毕业时间%s\n","2014-6");
	}
	
	void skills_now(){
		skills.push_back("unix/linux");
		skills.push_back("shell");
		skills.push_back("c/c++");
		skills.push_back("python");
	}

	void other_info(){
		other_table["IED"] = "vim  && ssh";
		other_table["socket"] = "TCP/IP";
		other_table["DB"] = "mysql&some oracle";
		other_table["project"] = "OJ(Judge Online) && vsftpd";
		other_table["architecture"] = "lamp && lnmp";
	}
	
};

bool interested_in_me()
{
	return true;
}

bool want_to_Computer_repair()
{
	return false;
}
int main(void)
{
	printf("hello world,this is my Resume\n");
	
	myself mdk ;

	mdk.name = "蒙代坤";
	mdk.email1 = "mengdaikun@gmail.com";
	mdk.email2 = "646978600@qq.com";
	mdk.phone = "18767161672";
	

	string first_choice = "Systems Engineer";
	string second_choice = "linux SA";
	string third_choice = "software Engineer";

	if(interested_in_me)
	{
		cout<<"This is my phone number: %s"<<mdk.phone<<endl;
		cout<<"This is my email1: %s"<<mdk.email1<<endl;
		cout<<"This is my email2: %s"<<mdk.email2<<endl;
	}
	else if(want_to_Computer_repair)
	{
		printf("oh,sorry\n");
	}
	else
	{
		printf("Thank you!!nice to meet you \n");
	}
	return 0;
}
