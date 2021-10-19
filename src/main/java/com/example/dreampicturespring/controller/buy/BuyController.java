package com.example.dreampicturespring.controller.buy;


import com.example.dreampicturespring.entity.Membershiptbl;
import com.example.dreampicturespring.entity.Paintingtbl;
import com.example.dreampicturespring.repository.CommentRepository;
import com.example.dreampicturespring.repository.MembershiptblRepository;
import com.example.dreampicturespring.repository.PaintingRepository;
import com.example.dreampicturespring.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Controller
public class BuyController {

    @Autowired
    PaintingRepository paintingRepository;
    @Autowired
    MembershiptblRepository membershiptblRepository;
    @Autowired
    CommentRepository commentRepository;

    @RequestMapping("/buy")
    public ModelAndView buy(){
        final int CARDSPERPAGE = 15;
        int cardNum = 0,pageNum;
        ModelAndView mv = new ModelAndView();

        List<CardVO> cardVOList = new ArrayList<>();
        List<String> list = paintingRepository.findAllPainting_Desc();
        for(String card : list){
            List<String> obj = Arrays.asList(card.split(","));
            CardVO vo = new CardVO(obj.get(0),obj.get(1)+"/avatarimg/avatarimg.jpg",obj.get(1)+"/paintingimg/"+obj.get(3)+"/0.jpg",obj.get(2),obj.get(3));
            cardVOList.add(vo);
            cardNum++;
        }

        List<String> comments = commentRepository.findCommenttbl(21);
        List<CommentVO> commentVOlist = new ArrayList<>();
        for(String commnet : comments){
            List<String> obj = Arrays.asList(commnet.split(","));
            Membershiptbl membershiptb = membershiptblRepository.getById(Integer.parseInt(obj.get(1)));
            CommentVO commentVO = new CommentVO();
            commentVO.setAvatarimg(membershiptb.getImg()+"/avatarimg/avatarimg.jpg");
            commentVO.setAuthor(membershiptb.getNickname());
            commentVO.setDate("1H");
            commentVO.setComments(obj.get(0));
            commentVOlist.add(commentVO);
        }


        pageNum = cardNum/CARDSPERPAGE+1;
        mv.setViewName("user/buy/buy");
        mv.addObject("commentVOlist",commentVOlist);
        mv.addObject("cardVOlist",cardVOList);
        mv.addObject("pageNum",pageNum);
        return mv;
    }

    @RequestMapping("/buy_picture/{no_painting}")
    public ModelAndView buy_picture(HttpServletRequest request, @PathVariable String no_painting) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/buy/buy_picture");
        Optional<Paintingtbl> PTBL = paintingRepository.findById(Integer.parseInt(no_painting));
        Paintingtbl paintingTBL = PTBL.get();
        Optional<Membershiptbl> MTBL = membershiptblRepository.findById(paintingTBL.getNo_membership());
        Membershiptbl membershipTBL = MTBL.get();
        PaintingVO paintingVO = new PaintingVO(paintingTBL,membershipTBL);
        mv.addObject("paintingVO",paintingVO);
        return mv;
    }

    @RequestMapping("/buy_payment/{no_painting}")
    public ModelAndView buy_payment(HttpServletRequest request, @PathVariable String no_painting) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/buy/buy_payment");
        HttpSession session =request.getSession();
        if(session.getAttribute("logStatus") == null){
            mv.setViewName("user/login/login");
            return mv;
        }
        Optional<Paintingtbl> PTBL = paintingRepository.findById(Integer.parseInt(no_painting));
        Paintingtbl paintingTBL = PTBL.get();
        Membershiptbl membershipTBL = membershiptblRepository.findByemail((String) session.getAttribute("logEmail"));
        PaymentVO paymentVO = new PaymentVO(paintingTBL,membershipTBL);
        System.out.println(paymentVO);
        mv.addObject("paymentVO",paymentVO);
        return mv;
    }

    @RequestMapping("/buy_transaction/{no_painting}")
    public ModelAndView buy_transaction(HttpServletRequest request, @PathVariable String no_painting) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/buy/buy_transaction");
        HttpSession session =request.getSession();
        if(session.getAttribute("logStatus") == null){
            mv.setViewName("user/login/login");
            return mv;
        }
        Optional<Paintingtbl> PTBL = paintingRepository.findById(Integer.parseInt(no_painting));
        Paintingtbl paintingTBL = PTBL.get();
        Optional<Membershiptbl> sellerMembershipTBL = membershiptblRepository.findById((paintingTBL.getNo_membership()));
        Membershiptbl sellerMembershiptbl = sellerMembershipTBL.get();
        Membershiptbl buyerMembershipTBL = membershiptblRepository.findByemail((String) session.getAttribute("logEmail"));
        TransactionVO transactionVO = new TransactionVO(paintingTBL,sellerMembershiptbl,buyerMembershipTBL);
        mv.addObject("transactionVO",transactionVO);
        return mv;
    }
}