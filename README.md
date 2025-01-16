# IglooMarket

## 프로젝트 소개
 RDBMS를 활용한 정규표현식 SQL문장 개발하는 프로젝트입니다.

---
## 팀소개
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
---

## 기술 stack
- mysql
- Dbeaver
- git
- notion
- discord
- slack

---

## DB 네트워크 구축
1. mysql의 bind-address 설정
1. mysql의 bind-address 설정 
    
    ```bash
    sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
    bind-address = 127.0.0.1 -> bind-address = 0.0.0.0
    
    ```
    



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

## 네트워크 설정

### 호스트PC 모바일 핫스팟 설정하기



### 게스트PC 와이파이 접속하기



### HostPC에서 접속 pc확인



### 호스트PC 방화벽 설정하기

제어판 > 시스템 및 보안 > Windows Defender 방화벽 > 고급 설정 

1  번



2  번



이후 모두 디폴트 값으로 진행하여 3306 포트에 대한 인바운드 규칙을 설정합니다.

### 게스트PC 방화벽 설정하기

제어판 > 시스템 및 보안 > Windows Defender 방화벽 > 고급 설정 > 아웃바운드 규칙 > 새규칙 > 포트(O) > TCP(T), 특정 원격 포트(S) 3306 > 연결 허용



### Host PC의 IP주소 확인 하기

CMD(커맨드 창) → ipconfig → 무선 LAN 어댑터 로컬 영역 연결* 2 → IPv4 주소(192.168.137.1)

### Oracle VirtualBox 설정

네트워크 → 포트포워딩 → 포트포워딩 규칙 추가



### Connection 만들기


Server Host : 호스트PC 의 IP주소  ex) 192.168.137.1

Database: 연결할 DB ex) igloo

Username: 사용자 계정 ex) kcgy02

Password: 비밀번호


---

## 데이터설계

### DDL, DML, ERD


---

## 정규표현식 SQL문

---

## 느낀점
