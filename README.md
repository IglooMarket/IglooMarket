# ❄️ 이글루마켓
  
## 목차  
1. [프로젝트 소개](#%EF%B8%8F-프로젝트-소개)  
2. [사용된 기술 스택](#-기술-stack)
3. [DB 네트워크 구축](#-db-네트워크-구축)
4. [DB 설계](#%EF%B8%8F-데이터설계)
5. [SQL 문제](#%EF%B8%8F-정규표현식-sql문-문제)
6. [트러블 슈팅](#-트러블-슈팅)
7. [느낀점](#-느낀점)
---
## 🐿️ 프로젝트 소개
- RDBMS를 활용한 정규표현식 SQL문장 개발
- 이글루마켓은 네고에 지친 중고거래 플랫폼입니다!
- 다음 사이트를 운영하기 위한 SQL문장을 작성해보세요!

---
## 🙌 팀소개
<table>
  <tbody>
    <tr>
      <td align="center">
         <a href="https://github.com/user0830">
          <img src="https://avatars.githubusercontent.com/u/82265395?v=4" width="150px;" alt=""/>
          <br /><sub><b> 구민지 </b></sub>
        </a>
        <br />
      </td>
      <td align="center">
          <a href="https://github.com/wns5120">
          <img src="https://avatars.githubusercontent.com/u/73707598?v=4" width="150px;" alt=""/>
          <br /><sub><b> 유호준 </b></sub>
        </a>
        <br />
      </td>
      <td align="center">
        <a href="https://github.com/woody6624">
          <img src="https://avatars.githubusercontent.com/u/103871252?v=4" width="150px;" alt=""/>
          <br /><sub><b> 김우현 </b></sub>
        </a>
        <br />
      </td>
      <td align="center">
        <a href="https://github.com/danidana2">
          <img src="https://avatars.githubusercontent.com/u/150885774?v=4" width="150px;" alt=""/>
          <br /><sub><b> 최다영 </b></sub>
        </a>
        <br />
      </td>
    </tr>
  </tbody>
</table>


## 🧿 기술 stack
![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white)
![DBeaver](https://img.shields.io/badge/dbeaver-FFD700.svg?style=for-the-badge&logo=dbeaver&logoColor=white)
![Notion](https://img.shields.io/badge/Notion-%23000000.svg?style=for-the-badge&logo=notion&logoColor=white)
![Discord](https://img.shields.io/badge/Discord-%235865F2.svg?style=for-the-badge&logo=discord&logoColor=white)
![Slack](https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=slack&logoColor=white)

---

## 🌐 DB 네트워크 구축
- 하나의 데이터베이스에서 다수의 사용자가 데이터 관리가 가능한 환경을 구축

- mysql 설정

1. mysql의 bind-address 설정 
    
    ```bash
    sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
    bind-address = 127.0.0.1 -> bind-address = 0.0.0.0
    
    ```
    
![image](https://github.com/user-attachments/assets/fabb308e-6119-44df-91f2-3a39d410a9cd)



2. mysql root 계정으로 Database에 접속 →  mysql -u root -p

```sql
-- 루트 계정으로 접속
루트 계정으로 접속 (username, password)
-- 데이터베이스 생성 (데이터베이스 이름 : igloo)
CREATE DATABASE igloo;

-- 각자에 해당하는 외부 접속 유저 생성
CREATE USER 'kcgy01'@'%' IDENTIFIED BY 'kcgy01';
CREATE USER 'kcgy02'@'%' IDENTIFIED BY 'kcgy02';
CREATE USER 'kcgy03'@'%' IDENTIFIED BY 'kcgy03';
CREATE USER 'kcgy04'@'%' IDENTIFIED BY 'kcgy04';

-- 유저 목록 확인
use mysql;
select user, host from user;
/*
Database changed
mysql> select user,host from user;
+------------------+-----------+
| user             | host      |
+------------------+-----------+
| kcgy01           | %         |
| kcgy02           | %         |
| kcgy03           | %         |
| kcgy04           | %         |
*/

-- 각 유저들에게 권한 부여(igloo 데이터베이스 하위의 모든 테이블에 대한 권한 부여)
GRANT ALL PRIVILEGES ON igloo.* TO 'kcgy01'@'%'; 
GRANT ALL PRIVILEGES ON igloo.* TO 'kcgy02'@'%'; 
GRANT ALL PRIVILEGES ON igloo.* TO 'kcgy03'@'%'; 
GRANT ALL PRIVILEGES ON igloo.* TO 'kcgy04'@'%'; 

-- 수정사항 적용
flush privileges;
```

- DB 환경 구축
<details>
<summary> 1. 호스트PC 모바일 핫스팟 설정하기 </summary>

![image](https://github.com/user-attachments/assets/7f44f95b-9e74-4205-85b2-b9183a9e07d9)

</details>



<details>
<summary> 2. 게스트PC 와이파이 접속하기</summary>

![image](https://github.com/user-attachments/assets/a0c18162-a2b0-4767-b7c0-9efdea0c558f)

</details>



<details>
<summary> 3. HostPC에서 접속 PC 확인</summary>

![image](https://github.com/user-attachments/assets/fde44f1d-8479-4c01-b10a-25f60e292186)

</details>



<details>
<summary> 4. 호스트PC 방화벽 설정하기</summary>

**제어판 > 시스템 및 보안 > Windows Defender 방화벽 > 고급 설정**

1번  
![image](https://github.com/user-attachments/assets/d93edb02-25bc-4fcd-9309-04db87a691eb)

2번  
![image](https://github.com/user-attachments/assets/5c844350-9e16-45f9-8e1f-a0735fb31b8b)

이후 모두 디폴트 값으로 진행하여 **3306 포트에 대한 인바운드 규칙**을 설정합니다.

</details>



<details>
<summary> 5. 게스트PC 방화벽 설정하기</summary>

**제어판 > 시스템 및 보안 > Windows Defender 방화벽 > 고급 설정 > 아웃바운드 규칙 > 새 규칙 > 포트(O) > TCP(T), 특정 원격 포트(S) 3306 > 연결 허용**

![image](https://github.com/user-attachments/assets/2b126ae9-d6e9-43a1-a040-aba1cde1a558)  
![image](https://github.com/user-attachments/assets/7600a5c2-e965-4ac0-b36d-391e5e726c49)  
![image](https://github.com/user-attachments/assets/fc068620-a9f4-41d2-8bf1-0e4868e25d07)  
![image](https://github.com/user-attachments/assets/95e6cbf3-8b82-4a09-aea3-f8a75bbdd456)  
![image](https://github.com/user-attachments/assets/dda5f6b8-667f-489e-8f44-4ad3aef28fe0)  
![image](https://github.com/user-attachments/assets/e7b1ea1b-e532-479f-89f2-2e6b2b4029bc)  

</details>



<details>
<summary> 6. Host PC의 IP주소 확인하기</summary>

CMD(커맨드 창) → `ipconfig` → 무선 LAN 어댑터 로컬 영역 연결* 2 → **IPv4 주소 (예: 192.168.137.1)**

</details>



<details>
<summary> 7. Oracle VirtualBox 설정</summary>

**네트워크 → 포트포워딩 → 포트포워딩 규칙 추가**

![image](https://github.com/user-attachments/assets/c8032422-fad8-41a8-a615-46f3e35ae5f2)

</details>



<details>
<summary> 8. Connection 만들기</summary>

1. **Server Host**: 호스트PC의 IP주소 (예: `192.168.137.1`)  
2. **Database**: 연결할 DB 이름 (예: `igloo`)  
3. **Username**: 사용자 계정 (예: `kcgy02`)  
4. **Password**: 비밀번호  

![image](https://github.com/user-attachments/assets/de4688b5-ee91-442e-9bbe-0f4d63cc82ce)  
![image](https://github.com/user-attachments/assets/d6a1f7db-e177-42b2-8716-8f3627f09749)  
![image](https://github.com/user-attachments/assets/c1d95753-60b5-41de-9752-9465e5e819ef)  
![image](https://github.com/user-attachments/assets/f5034688-2130-4076-9ca5-b2b41287136f)

</details> 



---

## ⚙️ 데이터설계

### ERD
![sdasdawd](https://github.com/user-attachments/assets/5552ba80-90b6-4f98-83c5-13a36a94d28b)

### DDL

---

### **1. 테이블: `users`**

| **변수명**      | **데이터 타입**        | **설명**                                                                                 |
|----------------|----------------------|-------------------------------------------------------------------------------------|
| `user_id`      | int auto_increment  | 사용자 고유 ID (자동 증가). 기본 키                                                      |
| `email`        | varchar(50)         | 사용자의 이메일 주소                                                  |
| `pwd`          | varchar(50)         | 사용자의 비밀번호                                                             |
| `phone_number` | varchar(50)         | 사용자의 전화번호                                                           |
| `name`         | varchar(50)         | 사용자의 이름                                                               |

---

### **2. 테이블: `products`**

| **변수명**        | **데이터 타입**        | **설명**                                                                                 |
|------------------|----------------------|-------------------------------------------------------------------------------------|
| `product_id`     | int auto_increment  | 상품 고유 ID (자동 증가). 기본 키                                                          |
| `owner_id`       | int                 | 상품 소유자 ID. `users` 테이블의 `user_id`와 연결된 외래 키                                  |
| `product_name`   | varchar(50)         | 상품 이름                                                                |
| `price`          | int                 | 상품 가격                                                               |
| `status`         | varchar(50)         | 상품 상태 (예: 판매 중, 판매 완료 등)                                               |
| `datetime`       | date                | 상품 등록 날짜를 저장                                                               |
| `description`    | text                | 상품에 대한 상세 설명을 저장                                                         |

---

### **3. 테이블: `messages`**

| **변수명**       | **데이터 타입** | **설명**                                                                                  |
|-----------------|---------------|--------------------------------------------------------------------------------------|
| `room_id`      | int           | 채팅방 고유 ID. `chatrooms` 테이블의 `room_id`와 연결된 외래 키                                  |
| `receiver_id`  | int           | 메시지 수신자 ID. `users` 테이블의 `user_id`와 연결된 외래 키                                    |
| `sender_id`    | int           | 메시지 발신자 ID. `users` 테이블의 `user_id`와 연결된 외래 키                                   |
| `content`      | text          | 메시지 내용을 저장                                                                |

---

### **4. 테이블: `chatrooms`**

| **변수명**       | **데이터 타입** | **설명**                                                                                  |
|-----------------|---------------|--------------------------------------------------------------------------------------|
| `room_id`      | int           | 채팅방 고유 ID. 기본 키                                                               |
| `receiver_id`  | int           | 채팅방의 수신자 ID. `users` 테이블의 `user_id`와 연결된 외래 키                                   |
| `sender_id`    | int           | 채팅방의 발신자 ID. `users` 테이블의 `user_id`와 연결된 외래 키                                   |
| `product_id`   | int           | 상품 고유 ID. `products` 테이블의 `product_id`와 연결된 외래 키                               |




---

## ⁉️ 정규표현식 SQL문 문제
### 1번) 가격이 특정 가격인 상품을 찾아서 가격 인상 또는 인하하세요. **(UPDATE, 정규표현식)**
**ex) 5만원인 상품을 7만원으로 가격 인상**



```
UPDATE products
SET price
```

수정 전)

![image](https://github.com/user-attachments/assets/374404b1-75a4-478e-8385-a772463a7c9f)

수정 후)

![image](https://github.com/user-attachments/assets/5b6be427-e5aa-47b5-8d69-4d675f959d4e)
<details>
  <summary><b>답안</b></summary>
 
```sql
UPDATE products
SET price = REGEXP_REPLACE(price, '50000', '70000')
WHERE price REGEXP '^50000$';
```
</details>
<br>

### 2번) 쿨하지 못한 '네고'라는 말을 사용하는 유저가 있는 채팅방 아이디를 찾으세요. **(SELECT, 정규표현식)**
```
SELECT room_id
FROM messages
```

![image](https://github.com/user-attachments/assets/cb875e82-5e42-4572-9f19-428cc6dd1356)



<details>
  <summary><b>답안</b></summary>
 
```sql
SELECT room_id FROM messages 
WHERE content REGEXP '네고';
```
</details>
<br>

### 3번) '네고' 라는 단어를 필터링해 '쿨거래'로 변경하세요. **(UPDATE, 정규표현식)**
**저희는 채팅 메시지에 네고라는 단어를 쓰면 후에 필터링을 통해 쿨거래로 바꿔드립니다.**<br>

<br><br>
**3-1. '네고'라는 단어를 포함한 메시지 내용 출력하세요.**
```
SELECT content
FROM messages
```

![image](https://github.com/user-attachments/assets/bbf918a3-e5fd-4322-981c-a18707cfe857)

<details>
  <summary><b>답안</b></summary>

```sql
SELECT content
FROM messages
WHERE content REGEXP '네고';
```
</details>

**3-2. 정규 표현식을 이용해 '네고'라는 단어를 '쿨거래'로 바꿔서 업데이트 하세요.**
```
UPDATE messages
SET content
```
수정 후 )

![image](https://github.com/user-attachments/assets/9137eccd-1475-444e-9f58-e25ce798470c)


<details>
  <summary><b>답안</b></summary>
 
```sql
UPDATE messages
SET content = REGEXP_REPLACE(content, '네고', '쿨거래')
WHERE content REGEXP '네고';
```
</details>

**3-3. '네고'라는 단어를 포함한 메시지 내용이 남아 있는지 출력하세요.**
```
SELECT content
FROM messages
```
![image](https://github.com/user-attachments/assets/d3ab6a67-901e-488b-ae48-e2634e102a12)


<details>
  <summary><b>답안</b></summary>

```sql
SELECT content
FROM messages
WHERE content REGEXP '네고';
```
</details>
<br>

### 4번. 형식을 지키지 않은 전화번호를 형식에 맞게 변경하세요. **(UPDATE, 정규표현식)**
**[-]가 없이 이어서 작성한 전화번호를 정해진 전화번호 형식으로 변경하세요.**<br>
**전화번호 형식: 010-0000-0000**<br>

<br><br>
**4-1. 정해진 형식이 아닌 전화번호를 가진 유저 정보를 모두 출력하세요.**
```
SELECT *
FROM users
```
![image](https://github.com/user-attachments/assets/18c38bf5-150e-48cc-8e51-6fc2ab269252)


<details>
  <summary><b>답안</b></summary>

```sql
SELECT *
FROM users
WHERE phone_number NOT REGEXP '^010-[0-9]{4}-[0-9]{4}$';
```
</details>

**4-2. 정규 표현식을 이용해 -가 없이 이어서 작성한 전화번호를 정해진 형식으로 바꿔서 업데이트 하세요.**
```
UPDATE users
SET phone_number
```
수정 후 )

![image](https://github.com/user-attachments/assets/c2034a6e-0d47-44eb-95c7-9f142b1ba97a)


<details>
  <summary><b>답안</b></summary>

```sql
UPDATE users
SET phone_number = CONCAT(SUBSTRING(phone_number, 1, 3), '-', SUBSTRING(phone_number, 4, 4), '-', SUBSTRING(phone_number, 8, 4))
WHERE phone_number REGEXP '^010[0-9]{8}$';
```
</details>

**4-3. 정해진 형식이 아닌 전화번호를 가진 유저 정보가 남아있는지 출력해 확인하세요.**
```
SELECT *
FROM users
```

![image](https://github.com/user-attachments/assets/50a43f6e-2750-4954-a3a3-86f36509f51f)

<details>
  <summary><b>답안</b></summary>

```sql
SELECT *
FROM users
WHERE phone_number NOT REGEXP '^010-[0-9]{4}-[0-9]{4}$';
```
</details>
<br>

### 5번. email에서 gmail을 사용하는 유저 이름을 모두 조회하세요. **(SELECT, 정규표현식)**

```
SELECT *
FROM users
```

![image](https://github.com/user-attachments/assets/0e7af5de-24c7-4612-ad94-25cc57fa2a83)

<details>
  <summary><b>답안</b></summary>

```sql
SELECT *
FROM users
WHERE email REGEXP '^[a-zA-Z0-9._%+-]+@gmail.com$';
```
</details>
<br>

### 6번. 변경된 비밀번호 정책을 만족하는 비밀번호를 가진 유저를 모두 조회하세요. **(SELECT, 정규표현식)**
**변경된 비밀번호 정책을 만족하는 비밀번호를 가진 유저를 모두 조회하려고 합니다.**<br>
**비밀번호를 정해진 형식에 맞게 필터링해서 조회하세요.**<br>
**[비밀번호 형식]**<br>
**1. 대문자 반드시 하나이상 포함**<br>
**2. 특수문자(!@#$%^&*) 반드시 하나이상 포함**<br>
**3. 비밀번호 길이가 8글자 이상 16글자 이하**<br>

```
SELECT *
FROM users
```

![image](https://github.com/user-attachments/assets/fd59da65-ebd5-41fb-98a2-43b947ad1084)

<details>
  <summary><b>답안</b></summary>

```sql
SELECT *
FROM users
WHERE pwd REGEXP '[A-Z]'                
  AND pwd REGEXP '[!@#$%^&*]'           
  AND LENGTH(pwd) BETWEEN 8 AND 16;
```
</details>
<br>

### 7번. 전화번호가 010 로 시작하지 않는 사람이 있습니다. 이 사람들의 앞자리 번호를 010으로 시작하도록 수정하세요 **(UPDATE, 정규표현식)**
**!!다음 sql문 insert하고 시작해주세요!**</br>
**INSERT INTO users (email, pwd, phone_number, name) VALUES ('user25@example.com', 'password25', '019-1234-0021', '오일남')**</br>
**(ex. 014-9876-1222 → 010-9876-1222)**</br>
**참고사항: 019, 014 등 여러개가 존재하는 가정상황입니다.  한문장으로 바꿔보세요.**</br>

```
UPDATE users
SET phone_number
```

수정 전 ) 

![image](https://github.com/user-attachments/assets/39c386f6-70aa-4f41-b0f6-c18271c2e0f0)


수정 후 )

![image](https://github.com/user-attachments/assets/6fdc6c2f-bcd9-4702-958e-607768a09d7e)


<details>
  <summary><b>답안</b></summary>

```sql
UPDATE users
SET phone_number = REGEXP_REPLACE(phone_number, substr(phone_number, 1,3), '010')
WHERE phone_number not REGEXP '^010';
```
</details>

<br>

---

## 💡 트러블 슈팅

### 문제 상황

**모바일 핫스팟을 키지 않은 상태에서 Virtual Box에 올라간 Ubuntu 서버를 가동할 시에 우분투 서버가 실행되지 않는 문제가 발생**

![Image](https://github.com/user-attachments/assets/75cc0d5d-307c-47fa-a823-54819a4a97f6)
<br><br>

### 문제 원인 
**호스트 IP(192.168.137.1) 과 게스트 IP(10.0.2.15) 사이 3306 포트로 포트포워딩을 구성하였기 떄문에 발생하는 문제. 만약 모바일 핫스팟을 켜지 않았다면 192.168.137.1에 대한 IP주소가 아직 할당되지 않은 상태이기 떄문에 발생**
![Image](https://github.com/user-attachments/assets/cd9ecc9a-2cb0-4f69-8459-b023d3acef8d)

### 해결법 
**모바일 핫스팟을 먼저 킨 후에 우분투 서버 실행**


![Image](https://github.com/user-attachments/assets/a9decc06-4a03-4063-bf89-cac961489700)

![Image](https://github.com/user-attachments/assets/456a3d97-49be-4c3d-9177-9938fb7a9529)






## 🎨 느낀점
- 유호준 : 평소에 협업 개발을 진행할 때는 데이터베이스를 AWS에서 공용으로 사용하곤 했었는데 이번 기회에 핫스팟을 이용해 같은 ip로 공용 데이터베이스를 만들어보는 연습을 해보며 네트워크에 대해 공부도 되어 뜻 깊었습니다.
  또한 sql문을 알고 있었으나 정규표현식을 들어보기만 하고 사용할 기회가 없었는데 이번에 문제를 내려고 공부하게 되고 사용법을 알게 되어서 얻어가는 것이 많은 프로젝트라고 생각합니다.  
- 김우현 : 백엔드 개발을 하면서 공유 데이터베이스가 필요할때마다 Aws의 RDS 서비스를 이용하여서 해결했었지만 이번에 모바일 핫스팟을 이용해 RDS와 같은 서비스를 이용하지 않고 직접 공용 DB를 구축해보는 과정을 통하여 네트워크에 대한 지식을 넓힐 수
  있었습니다. 정규표현식을 사용해보고 공부하면서 자바에서 String의 내부 메소드인 replaceAll과 같은 함수가 정규표현식을 사용한다는 것을 알게되어 문자열 변환 혹은 검증의 근간을 이루는 것이 정규표현식이라는 사실을 알게 되었습니다.
  이번 프로젝트는 이렇게 많은 것을 배우고 알게 된 내용을 정리할 수 있었던 프로젝트였다고 생각합니다.
- 최다영 : 네트워크 설정과 SQL 문제 설계 과정에서 팀원들과 다양한 아이디어를 공유하며 서로의 관점을 배우고 보완할 수 있었습니다. 특히 네트워크 환경에서 DB 원격 접속을 설정하고 활용하는 과정을 이해할 수 있었습니다. 핫스팟을 활용한 연결 구성과 포트포워딩, 방화벽 설정 등 네트워크 환경 구축의 중요성도 체감할 수 있었습니다. 또한, 정규표현식을 활용한 SQL 쿼리 작성은 데이터 검증과 처리의 유연성을 높여주었고, 문제를 설계하고 해결하며 정규표현식에 대한 이해와 활용 능력을 향상시킬 수 있었습니다.
-  구민지 : 한 명의 데이터베이스를 여러명이 접속하는 과정을 통해
네트워크 지식을 향상시키고
공용 데이터베이스를 실제로 사용해보는 기회를 가질 수 있었습니다. 
직접 테이블을 작성하고 정규표현식을 사용해 sql문을 작성하면서, 정규표현식의 개념과
지식을 얻고 이를 활용할 수 있는 능력을 키우게 된 것 같습니다.
