package com.sellers.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.sellers.vo.SellersVo;

@Repository
public class SellersDao {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public SellersDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    // 상품 테이블 mapper
    private static class ProductMapper implements RowMapper<SellersVo> {
        @Override
        public SellersVo mapRow(ResultSet rs, int rowNum) throws SQLException {
            SellersVo sellersVo = new SellersVo();
            sellersVo.setProduct_id(rs.getString("product_id"));
            sellersVo.setItem_name(rs.getString("item_name"));
            sellersVo.setQuantity(rs.getInt("quantity"));
            sellersVo.setCommission(rs.getInt("commission"));
            sellersVo.setSeller_id(rs.getString("seller_id"));
            return sellersVo;
        }
    }

    // 상품 추가
    public void write(String product_id, String item_name, int quantity, int commission, String seller_id) {
        String SQL = "INSERT INTO PRODUCT (" +
                "    product_id, " +
                "    item_name, " +
                "    quantity, " +
                "    commission, " +
                "    seller_id, " +
                "    REGDATE ) " +
				"	 VALUES (?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(
        		SQL
        		, product_id
        		, item_name
        		, quantity
        		, commission
        		, seller_id);
    }
}
