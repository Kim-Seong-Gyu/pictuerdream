package com.example.dreampicturespring.repository;

import com.example.dreampicturespring.entity.Paintingtbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PaintingRepository extends JpaRepository<Paintingtbl, Integer> {
    @Query(value = "select paintingtbl.no_painting,membershiptbl.img,membershiptbl.nickname,paintingtbl.pname from paintingtbl, membershiptbl where paintingtbl.no_membership = membershiptbl.no_membership", nativeQuery = true)
    List<String> findAllPainting_Desc();

    @Query(value = "select paintingtbl.no_painting,membershiptbl.img,membershiptbl.nickname,paintingtbl.pname from paintingtbl, membershiptbl where paintingtbl.no_membership = membershiptbl.no_membership and paintingtbl.status = 1", nativeQuery = true)
    List<String> findAllPainting_SoldOut();

    @Query(value = "select paintingtbl.no_painting,membershiptbl.img,membershiptbl.nickname,paintingtbl.pname from paintingtbl, membershiptbl where paintingtbl.no_membership = membershiptbl.no_membership and paintingtbl.no_painting = :no_painting", nativeQuery = true)
    List<String> findAllPainting_Reported(@Param("no_painting") Integer no_painting);


    @Query(value = "select * from paintingtbl where (:pname is null or paintingtbl.pname = :pname) and (:style is null or paintingtbl.style = :style) and (:theme is null or paintingtbl.theme = :theme) and paintingtbl.width<=:width and paintingtbl.height<=:height and paintingtbl.price<=:price ", nativeQuery = true)
    List<Paintingtbl> findPainting(@Param("pname") String pname, @Param("style") String style, @Param("theme") String theme, @Param("width") Integer width, @Param("height") Integer height, @Param("price") Integer price);

    @Query(value = "select count(*) from paintingtbl where paintingtbl.status = 1 ", nativeQuery = true)
    Integer countSold();

    @Query(value = "select count(*) from paintingtbl where paintingtbl.theme = :theme ", nativeQuery = true)
    Integer countTheme(@Param("theme") String theme);

    @Query(value = "select * from paintingtbl where paintingtbl.no_membership = :no_membership ", nativeQuery = true)
    List<Paintingtbl> findbyno_membership(@Param("no_membership") Integer no_membership);

}