package portal.common.util;

import java.util.Random;

public class RandomUtil {

	public static Integer[] mix(Integer[] numbers) {

        // Random 객체 생성
        Random random = new Random();

        // Fisher-Yates 셔플 알고리즘을 사용하여 숫자 배열 섞기
        for (int i = numbers.length - 1; i > 0; i--) {
            int j = random.nextInt(i + 1);
            
            // 숫자를 교환
            int temp = numbers[i];
            numbers[i] = numbers[j];
            numbers[j] = temp;
        }

        return numbers;
	}
	
//	public static void main(String[] args) {
//		Integer[] numbers = RandomUtil.mix(new Integer[] { 1,2,3,4,5,6,7,8 });
//		for (int number : numbers) {
//            System.out.println(number);
//        }
//
//	}
	
}
