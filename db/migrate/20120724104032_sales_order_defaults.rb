class SalesOrderDefaults < ActiveRecord::Migration
  def up
    execute "ALTER TABLE sales_orders ALTER COLUMN invoiced SET DEFAULT FALSE"
    execute "ALTER TABLE sales_orders ALTER COLUMN paid SET DEFAULT FALSE"

    execute <<-SQL
      UPDATE sales_orders SET invoiced = false where invoiced = NULL;
      UPDATE sales_orders SET paid = false where paid = NULL;
    SQL
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
