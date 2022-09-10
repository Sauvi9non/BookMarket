package book;

import java.util.ArrayList;
import book.Book;

public class BookRepository {
	private ArrayList<Book> listOfBooks = new ArrayList<Book>(); //Product클래스의 객체 담는 ArrayList 생성
	private static BookRepository instance = new BookRepository();
	
	public static BookRepository getInstance() {
		return instance;
	}
	
	public BookRepository() { //기본 생성자 bookId, name, unitPrice
		Book novel = new Book("ISBN060819", "데미안", 7000);
		
		novel.setAuthor("헤르만 헤세");
		novel.setDescription("새로운 일러스트로 다시 만나는 『데미안』!\r\n"
				+ "\r\n"
				+ "고뇌하고 방황하는 모든 청춘들을 위한 바이블, 노벨 문학상 수상 작가 헤르만 헤세가 이야기하는 ‘자기 자신에 이르는 길’의 여정. 출간 후 100년 가까이 지난 지금까지 전 세계 독자들이 열광하는 『데미안』, 가장 감각적이고 아름다운 옷을 입고 다시 태어나다!");
		novel.setPublisher("위즈덤하우스");
		novel.setCategory("소설");
		novel.setUnitsInStock(4);
		novel.setTotalPages(234);
		novel.setReleaseDate("2018-3-14");
		novel.setCondition("Ebook");
		novel.setFilename("ISBN060819.PNG"); //이미지파일명, 상품아이디번호.확장자로 저장했음
		
		Book poem = new Book("ISBN450815","하늘과 바람과 별과 시", 9800);
		
		poem.setAuthor("윤동주");
		poem.setDescription("별이 된 유고시집 [하늘과 바람과 별과 詩]\r\n"
				+ "1955년 10주기 기념 증보판\r\n"
				+ "\r\n"
				+ "“죽는 날까지 하늘을 우르러 한 점 부끄럼이 없기를...”\r\n"
				+ "");
		poem.setPublisher("소와 다리");
		poem.setCategory("시");
		poem.setUnitsInStock(3);
		poem.setTotalPages(256);
		poem.setReleaseDate("2016-1-1");
		poem.setCondition("New");
		poem.setFilename("ISBN450815.PNG");
		
		Book comics = new Book("ISBN200720","하이큐!! 45권",5000);
		comics.setAuthor("후루다테 하루이치");
		comics.setDescription("나는 날 수 있다! 배구에 매료되어 중학생 시절 최초이자 마지막 공식전에 출전한 히나타 쇼요. 하지만 '코트 위의 제왕'이라는 별명을 가진 천재 선수 카게야마에게 처참히 패하고 만다. 복수를 맹세한 히나타는 카라스노고 배구부의 문을 두드리는데?!");
		comics.setPublisher("대원씨아이");
		comics.setCategory("만화");
		comics.setUnitsInStock(9);
		comics.setTotalPages(224);
		comics.setReleaseDate("2021-3-22");
		comics.setCondition("Used");
		comics.setFilename("ISBN200720.PNG");
		
		//ArrayList에 추가
		listOfBooks.add(novel);
		listOfBooks.add(poem);
		listOfBooks.add(comics);
		
	} //생성자 끝
	
	//listOfProducts에 저장된 상품 목록 가져오는 함수
	public ArrayList<Book> getAllBooks(){
		return listOfBooks;
	}
	
	//도서 아이디와 일치하는 도서를 가져오는 함수
	public Book getBookById(String bookId){
		Book bookById = null; //우선 Id는 아직 없으니까 null로
		
		for (int i=0;i<listOfBooks.size();i++) { //Book객체 수 만큼 반복
			Book book = listOfBooks.get(i); //book은 ArrayList의 i번째 가져옴
			if(book != null && book.getBookId() != null &&  //가져온 i번째 book이 null이 아니고, 그 book의 Id가 null이 아니고
					book.getBookId().equals(bookId)) { //그 i번째 book이 검색한 bookId의 Id랑 같은 Id가지고 있으면
				bookById = book; //Id로 찾으려던 book은 저거고
				break; //반복문 끝
			}
		}
		return bookById;
	}
	
	//listOfBooks에 새로운 상품 정보 등록
	public void addBook(Book book) {
		listOfBooks.add(book);
	}
}
