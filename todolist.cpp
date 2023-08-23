#include "todolist.h"

ToDoList::ToDoList(QObject *parent)
    : QObject{parent}
{
    // for debug testing
    m_items.append({true, QStringLiteral("this is Task1")});
    m_items.append({true, QStringLiteral("Buy Milk")});
    m_items.append({true, QStringLiteral("Wash The Car")});
    m_items.append({true, QStringLiteral("Do Homework")});
    m_items.append({true, QStringLiteral("Commit Last changes")});
    m_items.append({true, QStringLiteral("Create new Repo")});
    m_items.append({true, QStringLiteral("this is Task1")});
    m_items.append({true, QStringLiteral("Buy Milk")});
    m_items.append({true, QStringLiteral("Wash The Car")});
    m_items.append({true, QStringLiteral("Do Homework")});
    m_items.append({true, QStringLiteral("Commit Last changes")});
    m_items.append({true, QStringLiteral("Create new Repo")});
    m_items.append({true, QStringLiteral("this is Task1")});
    m_items.append({true, QStringLiteral("Buy Milk")});
    m_items.append({true, QStringLiteral("Wash The Car")});
    m_items.append({true, QStringLiteral("Do Homework")});
    m_items.append({true, QStringLiteral("Commit Last changes")});
    m_items.append({true, QStringLiteral("Create new Repo")});
}

QVector<ToDoItem> ToDoList::items() const
{
    return m_items;
}

bool ToDoList::setItemAt(int index, const ToDoItem &item)
{
    if (index < 0 || index >= m_items.size())
        return false;

    const ToDoItem &oldItem = m_items.at(index);

    if (item.done == oldItem.done && item.title == oldItem.title)
        return false;

    m_items[index] = item;
    return true;        // true means model changed
}

void ToDoList::appendItem()
{
    emit preItemAppended();

    ToDoItem item;
    item.done = false;
    m_items.append(item);

    emit postItemAppended();
}

void ToDoList::removeCompletedItems()
{
    for (int i = 0; i < m_items.size();) {
        if (m_items.at(i).done) {
            emit preItemRemoved(i);
            m_items.removeAt(i);
            emit postItemRemoved();
        } else {
            i++;
        }
    }
}
