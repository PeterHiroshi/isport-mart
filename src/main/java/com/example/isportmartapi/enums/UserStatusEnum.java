package com.example.isportmartapi.enums;

/**
 * @author mahao
 * @since 2022-06-26
 */
public enum UserStatusEnum {
    /**
     * user deleted status
     */
    DELETED("1"),

    /**
     * user actived status
     */
    ACTIVED("2");

    private final String value;

    UserStatusEnum(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
