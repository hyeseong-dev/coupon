CREATE TABLE coupons (
    id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '쿠폰 ID',
    title VARCHAR(255) NOT NULL COMMENT '쿠폰명',
    coupon_type VARCHAR(255) NOT NULL COMMENT '쿠폰 타입 (예: 선착순 쿠폰 등)',
    total_quantity INT NULL COMMENT '쿠폰 발급 최대 수량',
    issued_quantity INT              COMMENT '발급된 쿠폰 수량',
    discount_amount INT              COMMENT '할인 금액',
    min_available_amount INT         COMMENT '최소 사용 금액',
    date_issue_start DATETIME(6) NOT NULL COMMENT '발급 시작 일시',
    date_issue_end   DATETIME(6) NOT NULL COMMENT '발급 종료 일시',
    date_created     DATETIME(6) NOT NULL COMMENT '생성 일시',
    date_updated     DATETIME(6) NOT NULL COMMENT '수정 일시'
)  ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COMMENT='쿠폰 정책';

CREATE TABLE coupon_issues (
    id              BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '쿠폰 발급 내역 ID',  -- 기본 키와 자동 증가 설정
    coupon_id       BIGINT(20) NOT NULL COMMENT '쿠폰 ID (외래 키)',
    user_id         BIGINT(20) NOT NULL COMMENT '유저 ID',
    date_issued     DATETIME(6) NOT NULL COMMENT '발급 일시',
    date_used       DATETIME(6) NULL COMMENT '사용 일시 (사용되지 않은 경우 NULL)',
    date_created    DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성 일시',
    date_updated    DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정 일시',
    PRIMARY KEY  (id)
) ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COMMENT='쿠폰 발급 내역';
