package com.dto;

import java.sql.Timestamp;

/**
 * QnA 게시글 DTO (qna 테이블 + users 테이블 JOIN 시 작성자명) qna: qna_no, user_id, title,
 * content, answer, answer_date, status, view_count, reg_date
 */
public class QnaDTO {

	private int qnaNo;
	private String userId; // qna.user_id (작성자 아이디)
	private String writerName; // users.name (목록/상세 표시용, JOIN으로 조회)

	private String title;
	private String content;
	private String answer;
	private String status; // WAITING, ANSWERED
	private int viewCount;

	private Timestamp answerDate;
	private Timestamp regDate;

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Timestamp getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(Timestamp answerDate) {
		this.answerDate = answerDate;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
}