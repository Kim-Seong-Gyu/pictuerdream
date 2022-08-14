package com.example.dreampicturespring.repository;

import com.example.dreampicturespring.entity.Admintbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminRepository extends JpaRepository<Admintbl, Integer> {// 테이블이름,프라이머리키 데이터타입

	@Query(value = "select admintbl.adminpwd from admintbl where admintbl.adminid = :adminID ", nativeQuery = true)
	String findByadminID(@Param("adminID") String adminID);

	@Query(value = "select admintbl.no_admin from admintbl where admintbl.adminid = :adminID ", nativeQuery = true)
	Integer findByadminID_no(@Param("adminID") String adminID);
}