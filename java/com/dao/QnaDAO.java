package com.dao;

import static com.util.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dto.QnaDTO;
import com.util.PageInfo;

public class QnaDAO {

	public int getQnaCount(String keyword, String userId) {

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = getConnection();

			StringBuilder sql = new StringBuilder();
			sql.append("SELECT COUNT(*) ");
			sql.append("FROM qna q ");
			sql.append("WHERE q.user_id = ? ");

			if (keyword != null && !keyword.isEmpty()) {
				sql.append("AND (q.title LIKE ? OR q.content LIKE ?) ");
			}

			ps = conn.prepareStatement(sql.toString());

			int idx = 1;
			ps.setString(idx++, userId);

			if (keyword != null && !keyword.isEmpty()) {
				String kw = "%" + keyword + "%";
				ps.setString(idx++, kw);
				ps.setString(idx, kw);
			}

			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
			close(conn);
		}

		return 0;
	}

	public List<QnaDTO> selectQnaList(PageInfo pi, String keyword, String userId) {

		List<QnaDTO> list = new ArrayList<>();

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = getConnection();

			StringBuilder sql = new StringBuilder();
			sql.append("SELECT q.*, u.user_id AS member_id, u.name AS member_name ");
			sql.append("FROM qna q ");
			sql.append("JOIN users u ON q.user_id = u.user_id ");
			sql.append("WHERE u.user_id = ? ");

			if (keyword != null && !keyword.isEmpty()) {
				sql.append("AND (q.title LIKE ? OR q.content LIKE ?) ");
			}

			sql.append("ORDER BY q.qna_no DESC ");
			sql.append("LIMIT ?, ?");

			ps = conn.prepareStatement(sql.toString());

			int idx = 1;

			ps.setString(idx++, userId);

			if (keyword != null && !keyword.isEmpty()) {
				String kw = "%" + keyword + "%";
				ps.setString(idx++, kw);
				ps.setString(idx++, kw);
			}

			ps.setInt(idx++, pi.getStartRow());
			ps.setInt(idx, pi.getEndRow());

			rs = ps.executeQuery();

			while (rs.next()) {
				QnaDTO q = new QnaDTO();
				q.setQnaNo(rs.getInt("qna_no"));
				q.setTitle(rs.getString("title"));
				q.setContent(rs.getString("content"));
				q.setAnswer(rs.getString("answer"));
				q.setAnswerDate(rs.getTimestamp("answer_date"));
				q.setStatus(rs.getString("status"));
				q.setViewCount(rs.getInt("view_count"));
				q.setRegDate(rs.getTimestamp("reg_date"));
				try {
					q.setMemberId(rs.getString("member_id"));
					q.setMemberName(rs.getString("member_name"));
				} catch (Exception ignore) {
				}

				list.add(q);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
			close(conn);
		}

		return list;
	}

	public QnaDTO selectQna(int no) {

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean viewUpdated = false;

		try {
			conn = getConnection();

			// 조회수 증가
			try {
				ps = conn.prepareStatement("UPDATE qna SET view_count = view_count + 1 WHERE qna_no = ?");
				ps.setInt(1, no);
				int updated = ps.executeUpdate();
				if (updated > 0) {
					viewUpdated = true;
				}
				close(ps);
				ps = null;
			} catch (Exception e) {
				e.printStackTrace();
			}

			StringBuilder sql = new StringBuilder();
			sql.append("SELECT q.*, u.user_id AS member_id, u.name AS member_name ");
			sql.append("FROM qna q ");
			sql.append("JOIN users u ON q.user_id = u.user_id ");
			sql.append("WHERE q.qna_no = ?");

			ps = conn.prepareStatement(sql.toString());
			ps.setInt(1, no);

			rs = ps.executeQuery();

			if (rs.next()) {
				QnaDTO q = new QnaDTO();
				q.setQnaNo(rs.getInt("qna_no"));
				q.setTitle(rs.getString("title"));
				q.setContent(rs.getString("content"));
				q.setAnswer(rs.getString("answer"));
				q.setAnswerDate(rs.getTimestamp("answer_date"));
				q.setStatus(rs.getString("status"));
				q.setViewCount(rs.getInt("view_count"));
				q.setRegDate(rs.getTimestamp("reg_date"));
				try {
					q.setMemberId(rs.getString("member_id"));
					q.setMemberName(rs.getString("member_name"));
				} catch (Exception ignore) {
				}

				if (viewUpdated) {
					commit(conn);
				} else {
					rollback(conn);
				}
				return q;
			}

		} catch (Exception e) {
			e.printStackTrace();
			if (conn != null) {
				rollback(conn);
			}
		} finally {
			close(rs);
			close(ps);
			close(conn);
		}

		return null;
	}

	public int insertQna(String userId, String title, String content) {

		Connection conn = null;
		PreparedStatement ps = null;
		int result = 0;

		try {
			conn = getConnection();

			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO qna (user_id, title, content, status, view_count, reg_date) ");
			sql.append("VALUES (?, ?, ?, 'WAITING', 0, NOW())");

			ps = conn.prepareStatement(sql.toString());
			ps.setString(1, userId);
			ps.setString(2, title);
			ps.setString(3, content);

			result = ps.executeUpdate();

			if (result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}

			return result;

		} catch (Exception e) {
			e.printStackTrace();
			if (conn != null) {
				rollback(conn);
			}
		} finally {
			close(ps);
			close(conn);
		}

		return 0;
	}
}