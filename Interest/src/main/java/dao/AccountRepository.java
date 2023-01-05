package dao;

import java.util.ArrayList;

import dto.Account;

public class AccountRepository {
	private ArrayList<Account> listOfAccounts = new ArrayList<Account>();

	
	private static AccountRepository instance = new AccountRepository();

	public static AccountRepository getInstance(){
		return instance;
	}
	public AccountRepository() {
		Account asavings = new Account("A101", "가나다통장", 5.0);
		asavings.setAccountId("A101");
		asavings.setCategory("저축은행");
		asavings.setRate(5.0);
		
		/*
		 * Account phone = new Account("P1234", "iPhone 6s", 800000); phone.
		 * setDescription("4.7-inch, 1334X750 Renina HD display, 8-megapixel iSight Camera"
		 * ); phone.setCategory("Smart Phone"); phone.setManufacturer("Apple");
		 * phone.setUnitsInStock(1000); phone.setCondition("New");
		 * phone.setFilename("P1234.png");
		 * 
		 * Account notebook = new Account("P1234", "iPhone 6s", 800000); notebook.
		 * setDescription("4.7-inch, 1334X750 Renina HD display, 8-megapixel iSight Camera"
		 * ); notebook.setCategory("Smart Phone"); notebook.setManufacturer("Apple");
		 * notebook.setUnitsInStock(1000); notebook.setCondition("New");
		 * notebook.setFilename("P1234.png");
		 */
		
		listOfAccounts.add(asavings);
		/*
		 * listOfAccounts.add(phone); listOfAccounts.add(notebook);
		 */
	}
	public ArrayList<Account> getAllProducts() {
		return listOfAccounts;
	
	}
	public Account getAccountById(String accountId) {
		Account accountById = null;

		for (int i = 0; i < listOfAccounts.size(); i++) {
			Account account = listOfAccounts.get(i);
			if (account != null && account.getAccountId() != null && account.getAccountId().equals(accountId)) {
				accountById = account;
				break;
			}
		}
		return accountById;
	}
	public void addAccount(Account account) {
		listOfAccounts.add(account);
	}
}
