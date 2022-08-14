package com.example.dreampicturespring.repository;

import com.example.dreampicturespring.entity.Membershiptbl;
import com.example.dreampicturespring.entity.Paintingtbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import javax.transaction.Transactional;
import java.util.List;

public interface MembershiptblRepository extends JpaRepository<Membershiptbl, Integer> {
	@Override
	Membershiptbl getById(Integer aInteger);

	Membershiptbl findByemail(String email);

	Membershiptbl findBypwd(String pwd);

	Membershiptbl findBynickname(String nickname);

	Boolean existsByemail(String email);

	Boolean existsBytel(String tel);

	Boolean existsBynickname(String nickname);

	@Query(value = "SELECT * FROM membershiptbl ORDER BY membershiptbl.no_membership DESC OFFSET :page*16 ROWS FETCH FIRST 16 ROWS ONLY", nativeQuery = true)
	List<Membershiptbl> findpage_member(@Param("page") Integer page);

	@Transactional
	@Modifying(clearAutomatically = true)
	@Query(value = "UPDATE membershiptbl SET membershiptbl.dreampay = :money + membershiptbl.dreampay WHERE membershiptbl.no_membership = :no_membership", nativeQuery = true)
	Integer UpdateDreampayPlus(@Param("money") Integer money, @Param("no_membership") Integer no_membership);

	@Query(value = "select * from membershiptbl where rownum < 4 order by membershiptbl.no_membership desc", nativeQuery = true)
	List<Membershiptbl> findLatest();

	@Query(value = "select * from membershiptbl where membershiptbl.email = :email", nativeQuery = true)
	Membershiptbl email_pwd(@Param("email") String email);
}